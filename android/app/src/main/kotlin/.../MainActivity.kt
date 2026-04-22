package com.zackify.admin

import android.Manifest
import android.os.Build
import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity

class MainActivity : AppCompatActivity() {

    override fun onCreate(
        savedInstanceState: Bundle?
    ) {

        super.onCreate(
            savedInstanceState
        )

        if (Build.VERSION.SDK_INT >= 33) {

            requestPermissions(
                arrayOf(
                    Manifest.permission
                        .POST_NOTIFICATIONS
                ),
                1
            )

        }

    }

}