using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.NetworkInformation;
using System.Security.Cryptography;
using System.Text;
using System.Web;

namespace BarunnIntergrationService.Common.Utillity
{
	public class AesUtility
	{
		private byte[] byteIV = new byte[32];
		private byte[] byteKey = new byte[32];

		public AesUtility(byte[] key, byte[] iv)
		{
			byteKey = key;
			byteIV = iv;
		}	

		public byte[] EncryptBytes(byte[] bytes)
		{
			Rijndael Rd = new RijndaelManaged();
			Rd.Mode = CipherMode.CBC;
			Rd.KeySize = 256;
			Rd.BlockSize = 256;
			Rd.IV = byteIV;
			Rd.Padding = PaddingMode.PKCS7;

			MemoryStream mIn = new MemoryStream(bytes);
			MemoryStream mOut = new MemoryStream();
			CryptoStream encStream = new CryptoStream(mIn, Rd.CreateEncryptor(byteKey, byteIV), CryptoStreamMode.Read);
			int bytesRead;

			byte[] output = new byte[bytes.Length];
			do
			{
				bytesRead = encStream.Read(output, 0, bytes.Length);
				if (bytesRead != 0)
					mOut.Write(output, 0, bytesRead);
			} while (bytesRead > 0);

			byte[] encrypted = mOut.ToArray();
			return encrypted;
		}

		public byte[] EncryptBytes128b(byte[] bytes)
		{
			Rijndael Rd = new RijndaelManaged();
			Rd.Mode = CipherMode.CBC;
			Rd.KeySize = 256;
			Rd.BlockSize = 128;
			Rd.IV = byteIV;
			Rd.Padding = PaddingMode.PKCS7;

			MemoryStream mIn = new MemoryStream(bytes);
			MemoryStream mOut = new MemoryStream();
			CryptoStream encStream = new CryptoStream(mIn, Rd.CreateEncryptor(byteKey, byteIV), CryptoStreamMode.Read);
			int bytesRead;

			byte[] output = new byte[bytes.Length];
			do
			{
				bytesRead = encStream.Read(output, 0, bytes.Length);
				if (bytesRead != 0)
					mOut.Write(output, 0, bytesRead);
			} while (bytesRead > 0);

			byte[] encrypted = mOut.ToArray();
			return encrypted;
		}

		public byte[] DecryptBytes(byte[] bytes)
		{
			Rijndael Rd = new RijndaelManaged();
			Rd.KeySize = 256;
			Rd.BlockSize = 256;
			Rd.Mode = CipherMode.CBC;
			Rd.IV = byteIV;
			Rd.Padding = PaddingMode.PKCS7;

			MemoryStream mInDec = new MemoryStream(bytes);
			MemoryStream mOut = new MemoryStream();
			CryptoStream decStream = new CryptoStream(mInDec, Rd.CreateDecryptor(byteKey, byteIV), CryptoStreamMode.Read);
			int bytesRead = 0;
			byte[] output = new byte[bytes.Length];
			do
			{
				bytesRead = decStream.Read(output, 0, bytes.Length);
				if (bytesRead != 0)
					mOut.Write(output, 0, bytesRead);
			} while (bytesRead > 0);

			byte[] decrypted = mOut.ToArray();
			return decrypted;
		}

		public byte[] DecryptBytes128b(byte[] bytes)
		{
			Rijndael Rd = new RijndaelManaged();
			Rd.KeySize = 256;
			Rd.BlockSize = 128;
			Rd.Mode = CipherMode.CBC;
			Rd.IV = byteIV;
			Rd.Padding = PaddingMode.PKCS7;

			MemoryStream mInDec = new MemoryStream(bytes);
			MemoryStream mOut = new MemoryStream();
			CryptoStream decStream = new CryptoStream(mInDec, Rd.CreateDecryptor(byteKey, byteIV), CryptoStreamMode.Read);
			int bytesRead = 0;
			byte[] output = new byte[bytes.Length];
			do
			{
				bytesRead = decStream.Read(output, 0, bytes.Length);
				if (bytesRead != 0)
					mOut.Write(output, 0, bytesRead);
			} while (bytesRead > 0);

			byte[] decrypted = mOut.ToArray();
			return decrypted;
		}

		public static byte[] hex2Byte(string hex)
		{
			byte[] bytes = new byte[hex.Length / 2];
			for (int i = 0; i < bytes.Length; i++)
			{
				try
				{
					bytes[i] = Convert.ToByte(hex.Substring(i * 2, 2), 16);
				}
				catch
				{
					throw new ArgumentException("hex is not a valid hex number!", "hex");
				}
			}
			return bytes;
		}
		public static string byte2Hex(byte[] bytes)
		{
			string hex = "";
			if (bytes != null)
			{
				for (int i = 0; i < bytes.Length; i++)
				{
					hex += bytes[i].ToString("X2");
				}
			}
			return hex;
		}

		//--본인인증에서 사용 변경불가!!
		public static string defaultKey = "qkfmsthszkemqocnfrncjsdjrekftjd";
		public static string Encrypt(string plain, string keyValue = "")
		{
			byte[] plainBytes = Encoding.UTF8.GetBytes(plain);			
			byte[] salt		  = GetSalt();
			if (string.IsNullOrEmpty(keyValue)) keyValue = defaultKey;
			byte[] key = Encoding.UTF8.GetBytes(keyValue);

			AesUtility wrappper = new AesUtility(key, salt);
			byte[] encryptedBytes = wrappper.EncryptBytes(plainBytes);

			string saltString = byte2Hex(salt);
			string encryptedString = byte2Hex(encryptedBytes);

			return saltString + encryptedString;
		}

		public static string Decrypt(string encryptedNSalt, string keyValue = "" )
		{
			string saltString = encryptedNSalt.Substring(0, 64);
			string encryptedString = encryptedNSalt.Substring(64);

			if (string.IsNullOrEmpty(keyValue)) keyValue = defaultKey;
			byte[] key = Encoding.UTF8.GetBytes(keyValue);
			byte[] salt = hex2Byte(saltString);
			byte[] encryptedBytes = hex2Byte(encryptedString);

			AesUtility wrappper = new AesUtility(key, salt);
			byte[] plainBytes = wrappper.DecryptBytes(encryptedBytes);

			string plainText = Encoding.UTF8.GetString(plainBytes);

			return plainText;
		}
		public static string Encrypt128b(string plain, string keyValue = "")
		{
			byte[] plainBytes = Encoding.UTF8.GetBytes(plain);
			byte[] salt = GetSalt128b();

			if (string.IsNullOrEmpty(keyValue)) keyValue = defaultKey;
			byte[] key = Encoding.UTF8.GetBytes(keyValue);

			AesUtility wrappper = new AesUtility(key, salt);
			byte[] encryptedBytes = wrappper.EncryptBytes128b(plainBytes);

			string saltString = byte2Hex(salt);
			string encryptedString = byte2Hex(encryptedBytes);

			return saltString + encryptedString;
		}

		public static string Decrypt128b(string encryptedNSalt, string keyValue = "")
		{
			string saltString = encryptedNSalt.Substring(0, 32);
			string encryptedString = encryptedNSalt.Substring(32);

			if (string.IsNullOrEmpty(keyValue)) keyValue = defaultKey;
			byte[] key = Encoding.UTF8.GetBytes(keyValue);

			byte[] salt = hex2Byte(saltString);
			byte[] encryptedBytes = hex2Byte(encryptedString);

			AesUtility wrappper = new AesUtility(key, salt);
			byte[] plainBytes = wrappper.DecryptBytes128b(encryptedBytes);

			string plainText = Encoding.UTF8.GetString(plainBytes);

			return plainText;
		}

		private static byte[] GetSalt()
		{
			byte[] salt = new byte[32];
			RNGCryptoServiceProvider rand = new RNGCryptoServiceProvider();
			rand.GetBytes(salt);

			return salt;
		}

		private static byte[] GetSalt128b()
		{
			byte[] salt = new byte[16];
			RNGCryptoServiceProvider rand = new RNGCryptoServiceProvider();
			rand.GetBytes(salt);

			return salt;
		}

		public static byte[] GetSalt(int Size)
		{
			byte[] salt = new byte[Size];
			RNGCryptoServiceProvider rand = new RNGCryptoServiceProvider();
			rand.GetBytes(salt);

			return salt;
		}
	}
}