package com.kh.cluster.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.FileCopyUtils;

public class UploadFileUtils {

	private static final Logger log = LoggerFactory.getLogger(UploadFileUtils.class);
	
	public static String uploadFile(String uploadPath, String originalName, byte[] fileData) throws Exception{
		// 랜덤 고유키 생성
		// 같은 경로에 동일한 이름의 파일을 업로드 할 때 중복값을 없애기 위해 사용
		UUID uid = UUID.randomUUID();
		
		// 원본파일 이름과 UUID 결합
		String savedName = uid.toString() + "_" + originalName;
		log.info("savedName : " + savedName);
		
		// 파일을 저장할 폴더 생성(년 월 일 기준)
		String savedPath = calcPath(uploadPath);
		
		// 저장할 파일준비
		File target = new File(uploadPath + savedPath, savedName);
		log.info("target: " + target);
		
		// 파일을 저장
		FileCopyUtils.copy(fileData, target);
		
		String formatName = originalName.substring(originalName.lastIndexOf(".")+1);
		
		String uploadedFileName = savedPath.replace(File.separatorChar, '/')+'/'+savedName;
		
		/* Todo : Image 처리*/
		// 파일의 확장자에 따라 썸네일(이미지일 경우)
		if(MediaUtils.getMediaType(formatName) != null) {
			makeThumbnail(uploadPath, savedPath, savedName);
		}
		
		// 썸네일명으로 화면에 전달
		return uploadedFileName;
	}
	
	// 썸네일 이미지 생성
	public static void makeThumbnail(String uploadPath, String path, String fileName) throws Exception{
		BufferedImage sourceImg = ImageIO.read(new File(uploadPath + path, fileName));
		
		BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 100);
		
		String thumbnauilName = uploadPath + path + File.separator + "s_" + fileName;
		
		File newFile = new File(thumbnauilName);
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		
		ImageIO.write(destImg, formatName.toUpperCase(), newFile);
	}
	
	// 폴더 생성 함수
	public static String calcPath(String uploadPath) {
		Calendar cal = Calendar.getInstance();
		
		String yearPath = File.separator + cal.get(Calendar.YEAR);
		
		String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH)+1);
		
		String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		
		makeDir(uploadPath, yearPath, monthPath, datePath);
		
		log.info(datePath);
		
		return datePath;
	}
	
	// 폴더 생성 함수
	private static void makeDir(String uploadPath, String... paths) {
		if(new File(paths[paths.length -1]).exists()) {
			return;
		}
		
		for(String path:paths) {
			File dirPath = new File(uploadPath + path);
			
			if(!dirPath.exists()) {
				dirPath.mkdir();
			}
			
		}
	}
}
