package util;

import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Date;
import java.util.Properties;
import java.util.Random;

/**
 * JavaMail 版本: 1.6.0 JDK 版本: JDK 1.7 以上（必须）
 */
public class SendEmail {

	public static String myEmailAccount = "nwpu_software@163.com";
	public static String myEmailPassword = "Um125asA28df";

	public static String myEmailSMTPHost = "smtp.163.com";
	public static String receiveMailAccount;


	/**
	 * 创建一封只包含文本的简单邮件
	 *
	 * @param session     和服务器交互的会话
	 * @param sendMail    发件人邮箱
	 * @param receiveMail 收件人邮箱
	 * @return
	 * @throws Exception
	 */
	public static MimeMessage createMimeMessage(Session session, String sendMail, String receiveMail, String content)
			throws Exception {

		MimeMessage message = new MimeMessage(session);

		message.setFrom(new InternetAddress(sendMail, "[人流检测开发组]", "UTF-8"));

		message.setRecipient(MimeMessage.RecipientType.TO, new InternetAddress(receiveMail, "用户", "UTF-8"));

		message.setSubject("[修改密码验证码]", "UTF-8");

		message.setContent(content, "text/html;charset=UTF-8");

		message.setSentDate(new Date());

		message.saveChanges();

		return message;
	}

	public static void sendEmail(String email, String content) throws Exception {
		Properties props = new Properties(); // 参数配置
		props.setProperty("mail.transport.protocol", "smtp"); // 使用的协议（JavaMail规范要求）
		props.setProperty("mail.smtp.host", myEmailSMTPHost); // 发件人的邮箱的 SMTP 服务器地址
		props.setProperty("mail.smtp.auth", "true"); // 需要请求认证

		// 根据配置创建会话对象, 用于和邮件服务器交互
		Session session = Session.getInstance(props);
		session.setDebug(true); // 设置为debug模式, 可以查看详细的发送 log

		// 创建一封邮件
		MimeMessage message = createMimeMessage(session, myEmailAccount, email, content);

		// 根据 Session 获取邮件传输对象
		Transport transport = session.getTransport();

		// 使用 邮箱账号 和 密码 连接邮件服务器, 这里认证的邮箱必须与 message 中的发件人邮箱一致, 否则报错
		transport.connect(myEmailAccount, myEmailPassword);

		// 发送邮件, 发到所有的收件地址, message.getAllRecipients() 获取到的是在创建邮件对象时添加的所有收件人, 抄送人, 密送人
		transport.sendMessage(message, message.getAllRecipients());

		// 关闭连接
		transport.close();
	}

	/*
	 * used to generate a random verification code
	 */
	public static String getVerificationCode() {
		String result = "";
		int[] num = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 };
		Random random = new Random();
		for (int i = 0; i < 6; i++) {
			result += num[random.nextInt(10)];
		}
		return result;
	}
	/**
	 * just used to test
	 * @param args
	 * @throws Exception
	 */
	public static void main(String[] args) throws Exception {
		String email = "yushang_jg@163.com";
		String message = getVerificationCode();
		sendEmail(email, message);
		
	}

}
