package com.sun.utils;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.net.UnknownHostException;

/**
 * ��ȡMAC��ַUtil
 * @author javadoc
 */
public class MacUtils {
	
	// ��������
	public static void main(String[] args) {
		try {
			System.out.println(new MACAddress().getMac("192.168.1.104"));
		} catch (SocketException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}

class MACAddress {
	/**
	 * ���IP��ַ��ȡmac��ַ
	 * 
	 * @param ipAddress
	 *            127.0.0.1
	 * @return
	 * @throws SocketException
	 * @throws UnknownHostException
	 */
	public static String getMac(String ipAddress) throws SocketException, UnknownHostException {
		// TODO Auto-generated method stub
		String str = "";
		String macAddress = "";
		final String LOOPBACK_ADDRESS = "127.0.0.1";
		// ���Ϊ127.0.0.1,���ȡ����MAC��ַ��
		if (LOOPBACK_ADDRESS.equals(ipAddress)) {
			InetAddress inetAddress = InetAddress.getLocalHost();
			// ò�ƴ˷�����ҪJDK1.6��
			byte[] mac = NetworkInterface.getByInetAddress(inetAddress).getHardwareAddress();
			// ��������ǰ�mac��ַƴװ��String
			StringBuilder sb = new StringBuilder();
			for (int i = 0; i < mac.length; i++) {
				if (i != 0) {
					sb.append("-");
				}
				// mac[i] & 0xFF ��Ϊ�˰�byteת��Ϊ������
				String s = Integer.toHexString(mac[i] & 0xFF);
				sb.append(s.length() == 1 ? 0 + s : s);
			}
			// ���ַ�����Сд��ĸ��Ϊ��д��Ϊ����mac��ַ������
			macAddress = sb.toString().trim().toUpperCase();
			return macAddress;
		} else {
			// ��ȡ�Ǳ���IP��MAC��ַ
			try {
				//ip��ַ
//				System.out.println(ipAddress);
				Process p = Runtime.getRuntime().exec("nbtstat -A " + ipAddress);
				//process
//				System.out.println("===process==" + p);
				InputStreamReader ir = new InputStreamReader(p.getInputStream());

				BufferedReader br = new BufferedReader(ir);

				while ((str = br.readLine()) != null) {
					if (str.indexOf("MAC") > 1) {
						macAddress = str.substring(str.indexOf("MAC") + 9, str.length());
						macAddress = macAddress.trim();
						//mac��ַ
//						System.out.println("macAddress:" + macAddress);
						break;
					}
				}
				p.destroy();
				br.close();
				ir.close();
			} catch (IOException ex) {
			}
			return macAddress;
		}
	}

}