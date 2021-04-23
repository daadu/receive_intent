package com.bhikadia.receive_intent

import android.content.Context
import android.content.Intent
import android.content.pm.PackageManager
import android.os.Build
import android.os.Bundle
import android.os.Parcelable
import java.security.MessageDigest

fun mapToBundle(map: Map<String, Any?>): Bundle {
    val bundle = Bundle();
    map.forEach {
        val k = it.key
        val v = it.value
        when (v) {
            is Byte -> bundle.putByte(k, v)
            is ByteArray -> bundle.putByteArray(k, v)
            is Char -> bundle.putChar(k, v)
            is CharArray -> bundle.putCharArray(k, v)
            is CharSequence -> bundle.putCharSequence(k, v)
            is Float -> bundle.putFloat(k, v)
            is FloatArray -> bundle.putFloatArray(k, v)
            is Parcelable -> bundle.putParcelable(k, v)
            is Short -> bundle.putShort(k, v)
            is ShortArray -> bundle.putShortArray(k, v)
            else -> throw IllegalArgumentException("$v is of a type that is not currently supported")
        }
    }
    return bundle;
}

fun mapToIntent(map: Map<String, Any?>): Intent = Intent().apply {
    putExtras(mapToBundle(map))
}


fun bundleToMap(extras: Bundle): Map<String, Any?> {
    val map: MutableMap<String, Any?> = HashMap()
    val ks = extras.keySet()
    val iterator: Iterator<String> = ks.iterator()
    while (iterator.hasNext()) {
        val key = iterator.next()
        map[key] = extras.get(key)
    }
    return map
}

fun getApplicationSignature(context: Context, packageName: String): List<String> {
    val signatureList: List<String>
    try {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
            // New signature
            val sig = context.packageManager.getPackageInfo(packageName, PackageManager.GET_SIGNING_CERTIFICATES).signingInfo
            signatureList = if (sig.hasMultipleSigners()) {
                // Send all with apkContentsSigners
                sig.apkContentsSigners.map {
                    val digest = MessageDigest.getInstance("SHA")
                    digest.update(it.toByteArray())
                    bytesToHex(digest.digest())
                }
            } else {
                // Send one with signingCertificateHistory
                sig.signingCertificateHistory.map {
                    val digest = MessageDigest.getInstance("SHA")
                    digest.update(it.toByteArray())
                    bytesToHex(digest.digest())
                }
            }
        } else {
            val sig = context.packageManager.getPackageInfo(packageName, PackageManager.GET_SIGNATURES).signatures
            signatureList = sig.map {
                val digest = MessageDigest.getInstance("SHA")
                digest.update(it.toByteArray())
                bytesToHex(digest.digest())
            }
        }

        return signatureList
    } catch (e: Exception) {
        // Handle error
    }
    return emptyList()
}

fun bytesToHex(bytes: ByteArray): String {
    val hexArray = charArrayOf('0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F')
    val hexChars = CharArray(bytes.size * 2)
    var v: Int
    for (j in bytes.indices) {
        v = bytes[j].toInt() and 0xFF
        hexChars[j * 2] = hexArray[v.ushr(4)]
        hexChars[j * 2 + 1] = hexArray[v and 0x0F]
    }
    return String(hexChars)
}
