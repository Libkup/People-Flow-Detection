package videoReceive;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.bytedeco.javacv.FFmpegFrameGrabber;
import org.bytedeco.javacv.FFmpegFrameRecorder;
import org.bytedeco.javacv.Frame;

import dao.CameralogDAO;
import entity.Cameralog;

public class Record implements Runnable{
	
	public int id;
	public String cameraName;
	public String rtmpAddress;
	public Record (int id, String cameraName, String rtmpAddress){
		this.id = id;
		this.cameraName = cameraName;
		this.rtmpAddress = rtmpAddress;
	}
	
  public void recordByFrame(Boolean status) throws Exception, org.bytedeco.javacv.FrameRecorder.Exception {  
	  System.out.println(cameraName + " is running");
	  FFmpegFrameGrabber grabber = new FFmpegFrameGrabber(rtmpAddress); 
	  System.out.println();
//	  OpenCVFrameGrabber grabber = new OpenCVFrameGrabber(rtmpAddress);
//	  FFmpegFrameGrabber grabber = FFmpegFrameGrabber.createDefault(rtmpAddress); 
	  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss");
      Date startTime = new Date();
      Date endTime = new Date(startTime.getTime() + 60000);
      String file = "F:/savedVideo/" + cameraName + "--" + sdf.format(startTime) + "--" + sdf.format(endTime) + ".mp4";
      System.out.println(file);
	  FFmpegFrameRecorder recorder = new FFmpegFrameRecorder(file, 1280, 720, 0); 
      recorder.setVideoBitrate(3000000);
      recorder.setVideoCodec(28);
        try { 
        	while(true){
        		Thread.sleep(1000);
        		if(new CameralogDAO().getCameraStatus(id).equals("open"))
        			break;
        		if(new Date().after(endTime)){
            		recorder.stop();  
            		startTime = new Date();
            	    endTime = new Date(startTime.getTime() + 60000);
            	    file = "F:/savedVideo/" + cameraName + "--" + sdf.format(startTime) + "--" + sdf.format(endTime) + ".mp4";
            	    recorder = new FFmpegFrameRecorder(file, 1280, 720, 0);
            	    recorder.setVideoBitrate(3000000);
            	    recorder.setVideoCodec(28);
            	}
        	}
        	System.out.println(cameraName);
        	grabber.start();
            System.out.println(rtmpAddress);
            recorder.start();
            Frame frame = null;  
            int i = 0;
            while (status) {
            	frame = grabber.grabFrame();
            	System.out.println(cameraName + " frame "+i);
            	i++;
            	if(new Date().after(endTime)){
            		recorder.stop();  
            		startTime = new Date();
            	    endTime = new Date(startTime.getTime() + 60000);
            	    file = "F:/savedVideo/" + cameraName + "--" + sdf.format(startTime) + "--" + sdf.format(endTime) + ".mp4";
            	    recorder = new FFmpegFrameRecorder(file, 1280, 720, 0); 
            	    recorder.setVideoBitrate(3000000);
            	    recorder.setVideoCodec(28);
            	    recorder.start();
            	}
            	if(frame != null)
            		recorder.record(frame);  
            	
//            	else {
//            		while(true){
//            			System.out.println("emtpy1111");
//	            		Thread.sleep(1000);
//	            		if(new CameralogDAO().getCameraStatus(id).equals("open"))
//	            			break;
//	            		if(new Date().after(endTime)){
//	            			System.out.println("emtpy");
//	                		recorder.stop();  
//	                		startTime = new Date();
//	                	    endTime = new Date(startTime.getTime() + 10000);
//	                	    file = "F:/savedVideo/" + cameraName + "-" + sdf.format(startTime) + "-" + sdf.format(endTime) + ".mp4";
//	                	    recorder = new FFmpegFrameRecorder(file, 1280, 720, 0);
//	                	}
//            		}
//            	}
            }  
            recorder.stop();  
            grabber.stop();  
        } catch (Exception e) {
        	recorder.stop();
        	e.printStackTrace();
		} 
    }  
	@Override
	public void run() {
		try {
			recordByFrame(true);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
		
	}
	  
  }