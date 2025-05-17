const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp();

exports.deleteExpiredUsers = functions.pubsub
  .schedule("every 24 hours")
  .onRun(async (context) => {
    const usersRef = admin.firestore().collection("users");
    const threshold = new Date(Date.now() - 30 * 24 * 60 * 60 * 1000);

    const snapshot = await usersRef
      .where("deleted", "==", true)
      .where("deletedAt", "<=", threshold)
      .get();

    const batch = admin.firestore().batch();

    snapshot.forEach((doc) => {
      batch.delete(doc.ref);
      admin.auth().deleteUser(doc.id); // Deleta do Authentication
    });

    await batch.commit();
    return null;
  });
