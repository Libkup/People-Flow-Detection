package dao;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import org.bytedeco.javacv.FFmpegFrameGrabber;
import org.bytedeco.javacv.FFmpegFrameRecorder;
import org.bytedeco.javacv.Frame;

import entity.Camera;
import videoReceive.Record;

public class test {

	
//	  public static void frameRecord(ArrayList<Camera> cameras, boolean AUDIO_ENABLED)  
//	            throws Exception, org.bytedeco.javacv.FrameRecorder.Exception {  
//	        // 是否录制音频  
//	        int audioChannel = AUDIO_ENABLED ? 1 : 0;  
//	        // 获取视频源  
//		  String inputFile = "rtmp://localhost:1935/live/camera1";
//	        FFmpegFrameGrabber grabber = new FFmpegFrameGrabber(inputFile);  
	        // 流媒体输出地址，分辨率（长，高），是否录制音频（0:不录制/1:录制）  
//	        Timestamp startTime = new Timestamp(System.currentTimeMillis());
//	        for(Camera camera : cameras){
//	        	new Record(camera.getName(), camera.getRtmpAddress()).run();
//	        }
	        
//	        FFmpegFrameRecorder recorder = new FFmpegFrameRecorder("F:/test1.mp4", 1280, 720, audioChannel); 
//	        recorder.setVideoBitrate(3000000);
	        // 开始取视频源  
//	        recordByFrame(AUDIO_ENABLED);  
//	    }    
	  
	  
//	  private static void recordByFrame(Boolean status)  
//	            throws Exception, org.bytedeco.javacv.FrameRecorder.Exception {  
//		  String inputFile = "rtmp://localhost:1935/live/camera1";
//		    
//		  FFmpegFrameRecorder recorder = new FFmpegFrameRecorder("F:/test1.mp4", 1280, 720, 0); 
//		  FFmpegFrameGrabber grabber = new FFmpegFrameGrabber(inputFile);
//	      recorder.setVideoBitrate(3000000);
//	        try {  //建议在线程中使用该方法  
//	        	
//	            grabber.start();  
//	            recorder.start();  
//	            Frame frame = null;  
//	            int i = 0;
//	            while (status && (frame = grabber.grabFrame()) != null) {  
//	            	System.out.println("test"+i);
//	            	i++;
//	            	if(i == 1000)
//	            		break;
//	                recorder.record(frame);  
//	            }  
//	            recorder.stop();  
//	            grabber.stop();  
//	        } catch (Exception e) {
//				System.out.println("error");
//			}finally {  
//	            if (grabber != null) {  
//	                grabber.stop();  
//	            }  
//	        }  
//	    }  
//	  
	  
	  public static void main(String[] args) throws Exception {  
	         CameraDAO cameraDAO = new CameraDAO();
	         ArrayList<Camera> cameras = cameraDAO.getCameraByName("");
	 		 ExecutorService exec = Executors.newCachedThreadPool();
	 		 ArrayList<Record> records = new ArrayList<>();
	         for(Camera camera : cameras){
	        	 	Record record = new Record(camera.getId(), camera.getName(),camera.getRtmpAddress());
//	        	 	status.add(record.getThreadStatus());
	        	 	records.add(record);
//	        	 	exec.execute(record);
	        	 	record.start();
	         }
	         while(true){
	        	 for(Record record : records){
	        		 if(record.getCurrentTime()!=null)
	        			 
	        			 if(new Date().after(new Date(record.getCurrentTime().getTime() + 60000))){
	        				 record.stopRecord();
	        			 } 
	        	 }
	        	 Thread.sleep(5000);
	         }
	}  
}