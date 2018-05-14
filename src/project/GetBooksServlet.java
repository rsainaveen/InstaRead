package project;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.net.*;
import java.util.HashMap;
import java.util.Map;

/**
 * Servlet implementation class HelloServlet
 */
@WebServlet("/getBooksServlet")
public class GetBooksServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GetBooksServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*
		 * String yourName = request.getParameter("yourName"); String[] words =
		 * yourName.split(" "); StringBuilder sb = new StringBuilder();
		 * for(String word :words){ sb.append(word + "+"); }
		 * sb.deleteCharAt(sb.length()-1); PrintWriter writer =
		 * response.getWriter(); writer.println("<h1>Hello " + yourName +
		 * "</h1>"); URL url; request.setAttribute("type", "ebook"); String type
		 * = (String)request.getAttribute("type"); HttpURLConnection connection
		 * = null; try { //Create connection url = new
		 * URL("https://itunes.apple.com/search?term="+sb.toString()+"&entity="+
		 * type); URLConnection conn = url.openConnection(); BufferedReader in =
		 * new BufferedReader( new InputStreamReader( conn.getInputStream()));
		 * String inputLine; StringBuilder result = new StringBuilder(); int idx
		 * = 0; while ((inputLine = in.readLine()) != null) {
		 * System.out.println(inputLine); result.append(inputLine);
		 * System.out.println(idx); idx++; } System.out.println(result);
		 * 
		 * in.close();
		 * 
		 * }finally{ if(connection != null) { connection.disconnect(); } }
		 * 
		 * writer.close();
		 */
		System.out.println("Calling API");
		BufferedReader in;
		String yourName = request.getParameter("yourName");
		String[] words = yourName.split(" ");
		StringBuilder sb = new StringBuilder();
		for (String word : words) {
			sb.append(word + "+");
		}
		sb.deleteCharAt(sb.length() - 1);
		try {
			URL url = new URL("https://itunes.apple.com/search?term=" + sb.toString() + "&entity=" + "ebook");
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			con.setDoOutput(true);
			con.setRequestProperty("Content-Type", "application/json");
			// send the request
			DataOutputStream out = new DataOutputStream(con.getOutputStream());
			out.flush();
			out.close();

			// Get the JSON response
			in = new BufferedReader(new InputStreamReader(con.getInputStream()));
			String inputLine;
			StringBuffer content = new StringBuffer();
			while ((inputLine = in.readLine()) != null) {
				content.append(inputLine);
			}
			response.setContentType("text/html;charset=UTF-8");
			response.getWriter().write(content.toString());
			System.out.println(content);
			in.close();
		} catch (IOException e) {
			System.out.println("No results found");
		}
	}
}
