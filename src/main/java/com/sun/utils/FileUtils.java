//package com.sun.utils;
//
//import java.awt.image.BufferedImageFilter;
//import java.io.BufferedInputStream;
//import java.io.BufferedOutputStream;
//import java.io.BufferedReader;
//import java.io.BufferedWriter;
//import java.io.File;
//import java.io.FileInputStream;
//import java.io.FileOutputStream;
//import java.io.FileReader;
//import java.io.FileWriter;
//import java.io.IOException;
//import java.io.InputStream;
//import java.io.OutputStream;
//import java.util.ArrayList;
//import java.util.Date;
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//import java.util.UUID;
//import java.util.regex.Matcher;
//import java.util.regex.Pattern;
//
//import javax.servlet.ServletException;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import org.apache.commons.fileupload.FileItem;
//import org.apache.commons.fileupload.FileUploadBase;
//import org.apache.commons.fileupload.ProgressListener;
//import org.apache.commons.fileupload.disk.DiskFileItemFactory;
//import org.apache.commons.fileupload.servlet.ServletFileUpload;
//import org.apache.log4j.Logger;
//
//import dao.SystemDao;
//import jxl.Cell;
//import jxl.Sheet;
//import jxl.Workbook;
//import jxl.write.Label;
//import jxl.write.WritableCellFormat;
//import jxl.write.WritableFont;
//import jxl.write.WritableSheet;
//import jxl.write.WritableWorkbook;
//
//public class FileUtils {
//	/**
//	 * @Method: makeFileName
//	 * @Description: ����ϴ��ļ����ļ����ļ����ԣ�uuid+"_"+�ļ���ԭʼ���
//	 * @Anthor:�°�����
//	 * @param filename
//	 *            �ļ���ԭʼ���
//	 * @return uuid+"_"+�ļ���ԭʼ���
//	 */
//	public String makeFileName(String filename) { // 2.jpg
//		// Ϊ��ֹ�ļ����ǵ�������ҪΪ�ϴ��ļ�����һ��Ψһ���ļ���
//		return UUID.randomUUID().toString() + "_" + filename;
//	}
//
//	/**
//	 * Ϊ��ֹһ��Ŀ¼�������̫���ļ���Ҫʹ��hash�㷨��ɢ�洢
//	 * 
//	 * @Method: makePath
//	 * @Description:
//	 * @Anthor:�°�����
//	 *
//	 * @param filename
//	 *            �ļ���Ҫ����ļ�����ɴ洢Ŀ¼
//	 * @param savePath
//	 *            �ļ��洢·��
//	 * @return �µĴ洢Ŀ¼
//	 */
//	public String makePath(String filename, String savePath) {
//		// �õ��ļ����hashCode��ֵ���õ��ľ���filename����ַ�������ڴ��еĵ�ַ
//		int hashcode = filename.hashCode();
//		int dir1 = hashcode & 0xf; // 0--15
//		int dir2 = (hashcode & 0xf0) >> 4; // 0-15
//		// �����µı���Ŀ¼
//		// String dir = savePath + "\\\\" + dir1 + "\\\\" + dir2; // upload\\2\\3
//		// upload\\3\\5
//		// ����ĳɲ����д��?ֱ�Ӵ洢�ڸ��ļ���
//		String dir = savePath;
//		// File�ȿ��Դ���ļ�Ҳ���Դ��Ŀ¼
//		File file = new File(dir);
//		// ���Ŀ¼������
//		if (!file.exists()) {
//			// ����Ŀ¼
//			file.mkdirs();
//		}
//		return dir;
//	}
//
//	public String getExcelFile(String savePath, String tempPath, HttpServletRequest request,
//			HttpServletResponse response) throws IOException, ServletException {
//		String excelPath = "";
//		FileUtils fu = new FileUtils();
//		File tmpFile = new File(tempPath);
//		if (!tmpFile.exists()) {
//			// ������ʱĿ¼
//			tmpFile.mkdir();
//		}
//		// ��Ϣ��ʾ
//		String message = "";
//		try {
//			// ʹ��Apache�ļ��ϴ���������ļ��ϴ����裺
//			// 1������һ��DiskFileItemFactory����
//			DiskFileItemFactory factory = new DiskFileItemFactory();
//			// ���ù����Ļ�����Ĵ�С�����ϴ����ļ���С�������Ĵ�Сʱ���ͻ����һ����ʱ�ļ���ŵ�ָ������ʱĿ¼���С�
//			factory.setSizeThreshold(1024 * 100);// ���û�����Ĵ�СΪ100KB�����ָ������ô������Ĵ�СĬ����10KB
//			// �����ϴ�ʱ��ɵ���ʱ�ļ��ı���Ŀ¼
//			factory.setRepository(tmpFile);
//			// 2������һ���ļ��ϴ�������
//			ServletFileUpload upload = new ServletFileUpload(factory);
//			// �����ļ��ϴ����
//			upload.setProgressListener(new ProgressListener() {
//				public void update(long pBytesRead, long pContentLength, int arg2) {
//					System.out.println("�ļ���СΪ��" + pContentLength + ",��ǰ�Ѵ��?" + pBytesRead);
//					/**
//					 * �ļ���СΪ��14608,��ǰ�Ѵ��?4096 �ļ���СΪ��14608,��ǰ�Ѵ��?7367
//					 * �ļ���СΪ��14608,��ǰ�Ѵ��?11419 �ļ���СΪ��14608,��ǰ�Ѵ��?14608
//					 */
//				}
//			});
//			// ����ϴ��ļ������������
//			upload.setHeaderEncoding("UTF-8");
//			// 3���ж��ύ����������Ƿ����ϴ��?�����
//			if (!ServletFileUpload.isMultipartContent(request)) {
//				// ���մ�ͳ��ʽ��ȡ���
//				return null;
//			}
//
//			// �����ϴ������ļ��Ĵ�С�����ֵ��Ŀǰ������Ϊ1024*1024�ֽڣ�Ҳ����1MB
//			upload.setFileSizeMax(1024 * 1024);
//			// �����ϴ��ļ����������ֵ�����ֵ=ͬʱ�ϴ��Ķ���ļ��Ĵ�С�����ֵ�ĺͣ�Ŀǰ����Ϊ10MB
//			upload.setSizeMax(1024 * 1024 * 10);
//			// 4��ʹ��ServletFileUpload�����������ϴ���ݣ��������ص���һ��List<FileItem>���ϣ�ÿһ��FileItem��Ӧһ��Form�?��������
//			List<FileItem> list = upload.parseRequest(request);
//			for (FileItem item : list) {
//				// ���fileitem�з�װ������ͨ����������
//				if (item.isFormField()) {
//					String name = item.getFieldName();
//					// �����ͨ���������ݵ�������������
//					String value = item.getString("UTF-8");
//					// value = new
//					// String(value.getBytes("iso8859-1"),"UTF-8");
//				} else {// ���fileitem�з�װ�����ϴ��ļ�
//					// �õ��ϴ����ļ���ƣ�
//					String filename = item.getName();
//					if (filename == null || filename.trim().equals("")) {
//						continue;
//					}
//					// ע�⣺��ͬ��������ύ���ļ����ǲ�һ��ģ���Щ������ύ�������ļ����Ǵ���·���ģ��磺
//					// c:\\a\\b\\1.txt������Щֻ�ǵ������ļ����磺1.txt
//					// �����ȡ�����ϴ��ļ����ļ����·�����֣�ֻ�����ļ����
//					filename = filename.substring(filename.lastIndexOf("\\\\") + 1);
//					// �õ��ϴ��ļ�����չ��
//					String fileExtName = filename.substring(filename.lastIndexOf(".") + 1);
//					// �����Ҫ�����ϴ����ļ����ͣ���ô����ͨ���ļ�����չ�����ж��ϴ����ļ������Ƿ�Ϸ�
//					// xlsx��xlsm��xltx��xltm��xlsb��xlam
//					if ("xls".equals(fileExtName) || "xlsx".equals(fileExtName) || "xlsm".equals(fileExtName)
//							|| "xltx".equals(fileExtName) || "xltm".equals(fileExtName) || "xlsb".equals(fileExtName)
//							|| "xlam".equals(fileExtName)) {
//						// ��ȡitem�е��ϴ��ļ���������
//						InputStream in = item.getInputStream();
//						// �õ��ļ���������
//						String saveFilename = fu.makeFileName(filename);
//						// �õ��ļ��ı���Ŀ¼
//						String realSavePath = fu.makePath(saveFilename, savePath);
//						// System.out.println("�ļ��ϴ�·����"+realSavePath);
//						// System.out.println("�ļ���"+saveFilename);
//						// excelPath-------excel�ļ��ڷ������˴洢λ��
//						excelPath = realSavePath + "\\\\" + saveFilename;
//						// ����һ���ļ������
//						FileOutputStream out = new FileOutputStream(realSavePath + "\\\\" + saveFilename);
//						// ����һ��������
//						byte buffer[] = new byte[1024];
//						// �ж��������е�����Ƿ��Ѿ�����ı�ʶ
//						int len = 0;
//						// ѭ�������������뵽�������У�(len=in.read(buffer))>0�ͱ�ʾin���滹�����
//						while ((len = in.read(buffer)) > 0) {
//							// ʹ��FileOutputStream�����������������д�뵽ָ����Ŀ¼(savePath +
//							// "\\\\" + filename)����
//							out.write(buffer, 0, len);
//						}
//						// �ر�������
//						in.close();
//						// �ر������
//						out.close(); 
//						// ɾ�����ļ��ϴ�ʱ��ɵ���ʱ�ļ� //
//						item.delete();
//					} else {
//						response.getWriter().print("���ϴ�excel�ļ�������");
//						return null;
//					}
//				}
//			}
//		} catch (FileUploadBase.FileSizeLimitExceededException e) {
//			response.getWriter().print("�ϴ��ļ�����ļ���С�벻Ҫ����1M(1025KB)������");
//			return null;
//		} catch (FileUploadBase.SizeLimitExceededException e) {
//			response.getWriter().print("�ϴ��ļ�����ļ���С�벻Ҫ����1M(1025KB)������");
//			request.getRequestDispatcher("/message.jsp").forward(request, response);
//			return null;
//		} catch (Exception e) {
//			response.getWriter().print("�ļ��ϴ�ʧ�ܣ�����");
//			return null;
//		}
//		return excelPath;
//	}
//
//	public static List<String> readExcel(String excelFilePath, String systemId,String webPath) {
//		SystemDao sDao = new SystemDao();
//		Map<String, String> tables = sDao.getTables(systemId);
//		String dataTable = tables.get("dataTable");
//		String filedTable = tables.get("filedTable");
//		String dataFiledsTable = tables.get("dataFiledsTable");
//		List<String> datas = new ArrayList<String>();
//		// �����洢title��content��map
//		Map<String, String> titles = new HashMap<String, String>();
//		Map<String, String> contents = new HashMap<String, String>();
//		Workbook rwb = null;
//		Cell cell = null;
//
//		// ����������
//		InputStream stream = null;
//		try {
//			stream = new FileInputStream(excelFilePath);
//
//			// ��ȡExcel�ļ�����
//			rwb = Workbook.getWorkbook(stream);
//			// ��ȡ�ļ���ָ�������� Ĭ�ϵĵ�һ��
//			Sheet sheet = rwb.getSheet(0);
//
//			// ����(��ͷ��Ŀ¼����Ҫ����1��ʼ)
//			for (int i = 0; i < sheet.getRows(); i++) {
//
//				// ����
//				for (int j = 0; j < sheet.getColumns(); j++) {
//
//					// ��ȡ��i�У���j�е�ֵ
//					cell = sheet.getCell(j, i);
//					// ����ǵ�һ�У�����Ϊ���⣬��ӵ�titles Map��
//					if (0 == i) {
//						// 1 2 3 4 5.... t1 t2 t3 t4 t5
//						titles.put(j + 1 + "", cell.getContents());
//					} else {
//						// 11 12 13... c11 c12 c13 ... 21 22 23... c21 c22 c23
//						contents.put(i + "" + j, cell.getContents());
//					}
//				}
//				// �Ѹջ�ȡ���д���list
//			}
//
//			// Ҫ������ֶ�
//			String fileds = "";
//			for (int j = 1; j <= titles.size(); j++) {
//				fileds += titles.get(j + "") + ",";
//			}
//			fileds = fileds.substring(0, fileds.length() - 1);
//			// �����������
//			// ������Ϊ�洢���� ��*�� ������������������ ��ݸ���/����
//			int lineNum = contents.size() / titles.size();
//			for (int i = 1; i <= lineNum; i++) {
//				StringBuffer sql = new StringBuffer();
//				sql.append("insert into " + dataTable + " (");
//				sql.append(fileds);
//				sql.append(") values(");
//				// ÿ����ݵ�ƴ��
//				for (int j = 0; j < titles.size(); j++) {
//					String data = contents.get(i + "" + j);
//					sql.append("'" + data + "',");
//				}
//				sql.delete(sql.length() - 1, sql.length());
//				sql.append(");");
//				datas.add(sql.toString());
//			}
//		} catch (Exception e) {
//			Logger file_error_log = LoggerUtils.getLogg(LoggerUtils.file_error_log,webPath);
//			file_error_log.error(LoggerUtils.getDate() + "excel��ݶ�ȡʱ�쳣�������ϴ���excel�ļ�");
//			return null;
//		} finally {
//			try {
//				rwb.close();
//				stream.close();
//			} catch (Exception e) {
//				Logger other_error_log = LoggerUtils.getLogg(LoggerUtils.other_error_log,webPath);
//				other_error_log.error(LoggerUtils.getDate() + "FileUtils.readExcel����[��Դ�ر��쳣]");
//			}
//		}
//		return datas;
//	}
//
//	public HttpServletResponse download(String path, HttpServletResponse response) {
//		try {
//			// path��ָ�����ص��ļ���·����
//			File file = new File(path);
//			// ȡ���ļ���
//			String filename = file.getName();
//			// ȡ���ļ��ĺ�׺��
//			String ext = filename.substring(filename.lastIndexOf(".") + 1).toUpperCase();
//			// ��������ʽ�����ļ���
//			InputStream fis = new BufferedInputStream(new FileInputStream(path));
//			byte[] buffer = new byte[fis.available()];
//			fis.read(buffer);
//			fis.close();
//			// ���response
//			response.reset();
//			// ����response��Header
//			response.addHeader("Content-Disposition", "attachment;filename=" + new String(filename.getBytes()));
//			response.addHeader("Content-Length", "" + file.length());
//			OutputStream toClient = new BufferedOutputStream(response.getOutputStream());
//			response.setContentType("application/octet-stream");
//			toClient.write(buffer);
//			toClient.flush();
//			toClient.close();
//		} catch (IOException ex) {
//			ex.printStackTrace();
//		}
//		return response;
//	}
//
//	// �����ݴ���excel
//	public static String writeExcel(Map<Integer, String> datas, String excelPath) {
//		// String[] title = { "���", "��Ʒ���", "��Ʒ�۸�", "��Ʒ����", "�������", "���", "�Ƿ����"
//		// };
//		// ����Excel������
//		WritableWorkbook wwb = null;
//		OutputStream os = null;
//		String fileName = null;
//		try {
//			// �����excel��·��
//			String filePath = excelPath;
//			// �½���һ��jxl�ļ�,���ƶ�λ�ô���excel�ļ�
//			//�ļ���Ϊ��ǰʱ��
//			fileName = new Long(new Date().getTime()).toString() + ".xls";
//			File file = new File(filePath + "\\\\" + fileName);
////			System.out.println(fileName);
//			//���ǰ�ļ�ȷʵ��Ŀ¼û�д������򴴽���Ŀ¼
//			File parent = file.getParentFile();
//			if (parent != null && !parent.exists()) {
//				parent.mkdirs();
//			}
//			file.createNewFile();
//			os = new FileOutputStream(file);
//			wwb = Workbook.createWorkbook(os);
//			// ��ӵ�һ�������?���õ�һ��Sheet������
//			WritableSheet sheet = wwb.createSheet("���", 0);
//			Label label;
//			int length;
//			for (Integer index : datas.keySet()) {
//				// indexΪ��
//				String title_content[] = datas.get(index).split(",");
//				// lengthΪ��
//				length = title_content.length;
//				for (int i = 0; i < length; i++) {
//					String d_c[] = title_content[i].split(":");
//					if(d_c[0]=="null" || d_c[0]==null){
//						d_c[0]="";
//					}
//					label = new Label(i, 0, d_c[0]);
//					sheet.addCell(label);
////					System.out.print("d_c[0]="+d_c[0]+":");
//					if(d_c.length>1){
//						if(d_c[1]=="null" || d_c[1]==null){
//							d_c[1]="";
//						}
//						label = new Label(i, index + 1, d_c[1]);
////						System.out.println("d_c[1]="+d_c[1]);
//					}else{
//						label = new Label(i, index + 1, "");
////						System.out.println("d_c[1]="+"");
//					}
//					sheet.addCell(label);
////					System.out.println();
//				}
//			}
//			// for (int i = 0; i < title.length; i++) {
//			// // Label(x,y,z) ��?Ԫ��ĵ�x+1�У���y+1��, ����z
//			// // ��Label������Ӷ�����ָ����Ԫ���λ�ú�����
//			// label = new Label(i, 0, title[i]);
//			// label = new Label(i, 0, title[i], getHeader());
//			// // ������õĵ�Ԫ����ӵ���������
//			// sheet.addCell(label);
//			// }
//			// ������������
//
//			// д�����
////			sheet.getSettings().setProtected(false);
//			wwb.write();
//			wwb.close();
//		} catch (Exception e) {
//			Logger file_error_log = LoggerUtils.getLogg(LoggerUtils.file_error_log);
//			file_error_log.error(LoggerUtils.getDate()+"excel����ʱ���excel����");
//		} finally {
//			try {
//				os.close();
//			} catch (IOException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//		}
//		return fileName;
//	}
//
//	// ���õ�Ԫ����ʽ
//	public static WritableCellFormat getHeader() {
//		WritableFont font = new WritableFont(WritableFont.TIMES, 10, WritableFont.BOLD);// ��������
//		// try {
//		// font.setColour(Colour.BLUE);// ��ɫ����
//		// } catch (WriteException e1) {
//		// e1.printStackTrace();
//		// }
//		WritableCellFormat format = new WritableCellFormat(font);
//		// try {
//		// format.setAlignment(jxl.format.Alignment.CENTRE);// ���Ҿ���
//		// format.setVerticalAlignment(jxl.format.VerticalAlignment.CENTRE);//
//		// ���¾���
//		// format.setBorder(Border.ALL, BorderLineStyle.THIN, Colour.BLACK);//
//		// ��ɫ�߿�
//		// format.setBackground(Colour.YELLOW);// ��ɫ����
//		// } catch (WriteException e) {
//		// e.printStackTrace();
//		// }
//		return format;
//	}
//
//	public static void deleteFile(String webPath) throws IOException{
////		String user_dir = System.getProperty("user.dir");
//		String file_separator = System.getProperty("file.separator");
//		String path = webPath+file_separator+"deleteFile.properties";
//		File file = new File(path);
//		if(!file.exists()){
//			file.createNewFile();
//		}
//		BufferedReader br = new BufferedReader(new FileReader(file));
//		String line = "";
//		while((line = br.readLine())!=null){
//			File temp = new File(line);
//			if(temp.exists()){
//				temp.delete();
//			}
//		}
//		br.close();
//	}
//	
//	public static void addDeleteList(String excelPath,String webPath) throws IOException{
////		String user_dir = System.getProperty("user.dir");
//		String file_separator = System.getProperty("file.separator");
//		String line_separator = System.getProperty("line.separator");
//		String path = webPath+file_separator+"deleteFile.properties";
//		File file = new File(path);
//		if(!file.exists()){
//			file.createNewFile();
//		}
//		BufferedWriter bw = new BufferedWriter(new FileWriter(file));
//		bw.write(excelPath+line_separator);
//		bw.close();
//	}
//	public static void main(String[] args) {
////		Map<Integer, String> map = new HashMap<Integer,String>();//	
////		map.put(1, "��������:����,�����Ʒ��:����Y580,test:null,mac��ַ:04-7D-7B-E6-AF-53,����ϵͳ:windows8,id:1,ip��ַ:192.168.1.14,������:����");
////		map.put(2, "��������:����,�����Ʒ��:����Y580,test:null,mac��ַ:04-7D-7B-E6-AF-53,����ϵͳ:windows8,id:1,ip��ַ:192.168.1.14,������:����");
////		map.put(3, "��������:����,�����Ʒ��:����Y580,test:null,mac��ַ:04-7D-7B-E6-AF-53,����ϵͳ:windows8,id:1,ip��ַ:192.168.1.14,������:����");
////		writeExcel(map, "C:\\\\Users\\\\Administrator\\\\Desktop");
//		
//	}
//
//}
