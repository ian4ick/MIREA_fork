import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

public class NumberGeneratorHttpServer {
    public static final int PORT = 8080;
    private static final Random random = new Random();
    public static void main(String[] args) {
        try (ServerSocket serverSocket = new ServerSocket(PORT)){
            System.out.println("Listening on port " + PORT);
            while(true){
                try (Socket clientSocket = serverSocket.accept()){
                    handleClient(clientSocket);
                }
            }
        }
        catch (IOException e){
            e.printStackTrace();
        }
    }
    private static void handleClient(Socket clientSocket) throws IOException {
        BufferedReader in = new BufferedReader(new InputStreamReader(clientSocket.getInputStream()));
        PrintWriter out = new PrintWriter(clientSocket.getOutputStream());
        String inputLine = in.readLine();
        System.out.println(inputLine);
        HashMap<String, String> request;
        try{
            request = requestParser(inputLine);
        }
        catch (Exception e){
            request = new HashMap<>();
        }
        String response;
        try {
            String answer = getAnswer(request);
            response = "HTTP/1.1 200 OK\r\n" +
                    "Server: RandomNumberServer\r\n" +
                    "Content-Type: text/plain\r\n" +
                    "Content-Length: " + answer.length() + "\r\n" +
                    "Connection: close\r\n\r\n";
            response += answer;
        }
        catch (Exception e){
            String errorMessage = "400 Bad Request";
            response = "HTTP/1.1 400 Bad Request\r\n" +
                    "Server: RandomNumberServer\r\n" +
                    "Content-Type: text/plain\r\n" +
                    "Content-Length: " + errorMessage.length() + "\r\n" +
                    "Connection: close\r\n\r\n";
            response += errorMessage;
        }
        out.write(response);
        out.flush();
    }
    private static HashMap<String, String> requestParser(String request){
        HashMap<String, String> dict = new HashMap<>();
        dict.put("type", request.substring(0, request.indexOf(" ")));
        request = request.substring(request.indexOf(" ") + 1);
        dict.put("content", request.substring(0, request.indexOf(" ")));
        request = request.substring(0, request.indexOf(" "));
        dict.put("mode", request.substring(0, request.indexOf("?")));
        request = request.substring(request.indexOf("=") + 1);
        dict.put("min", request.substring(0, request.indexOf("&")));
        request = request.substring(request.indexOf("=") + 1);
        dict.put("max", request);

        return dict;
    }
    private static String getAnswer(HashMap<String, String> request) throws Exception {
        String type = request.get("type");
        if (!type.equals("GET"))
            throw new Exception("Wrong request");
        String mode = request.get("mode");
        if (!mode.equals("/random"))
            throw new Exception("Wrong request");
        int min = Integer.parseInt(request.get("min"));
        int max = Integer.parseInt(request.get("max"));
        int result = random.nextInt(max - min) + min;
        return Integer.toString(result);
    }
}
