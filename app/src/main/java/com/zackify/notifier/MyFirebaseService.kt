package com.admin.zackify

import android.app.NotificationChannel
import android.app.NotificationManager
import androidx.core.app.NotificationCompat
import com.google.firebase.messaging.FirebaseMessagingService
import com.google.firebase.messaging.RemoteMessage

class MyFirebaseService :
    FirebaseMessagingService() {

    override fun onNewToken(
        token: String
    ) {

        println(
            "FCM TOKEN: $token"
        )

    }

    override fun onMessageReceived(
        message: RemoteMessage
    ) {

        val title =
            message.notification?.title
                ?: "New Order"

        val body =
            message.notification?.body
                ?: "You have a new order"

        showNotification(
            title,
            body
        )

    }

    private fun showNotification(
        title: String,
        body: String
    ) {

        val manager =
            getSystemService(
                NOTIFICATION_SERVICE
            ) as NotificationManager

        val channelId =
            "orders"

        val channel =
            NotificationChannel(
                channelId,
                "Order Notifications",
                NotificationManager
                    .IMPORTANCE_HIGH
            )

        manager
            .createNotificationChannel(
                channel
            )

        val notification =
            NotificationCompat.Builder(
                this,
                channelId
            )
                .setContentTitle(
                    title
                )
                .setContentText(
                    body
                )
                .setSmallIcon(
                    android.R.drawable
                        .ic_dialog_info
                )
                .setAutoCancel(
                    true
                )
                .build()

        manager.notify(
            1,
            notification
        )

    }

    }
