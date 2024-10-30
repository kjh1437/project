package com.pilloud.service;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class CommonService {
	public void sendEmail(String email, String name, HttpSession session) {
	
		//4. 공공 데이터 REST API 요청 처리
	};
	
	// 공공 데이터 REST API 요청 처리=========================================================================
	public String xml_list(StringBuilder url) {
		String result = url.toString();
		System.out.print(url);
		try {
			HttpURLConnection conn
			 = (HttpURLConnection)new URL( result ).openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");
			BufferedReader rd;
	        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	            rd = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
	        } else {
	            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream(), "utf-8"));
	        }
	        StringBuilder sb = new StringBuilder();
	        String line;
	        while ((line = rd.readLine()) != null) {
	            sb.append(line);
	        }
	        rd.close();
	        conn.disconnect();
			result = sb.toString();
			System.out.println(result);
			
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}
	
	//JSON
	public String json_list(StringBuilder url) {
	    JSONObject json = null;

	    try {
	        String xmlData = xml_list(url);

	        if (xmlData != null) {
	            json = (JSONObject) new JSONParser().parse(xmlData);
	            json = (JSONObject) json.get("response");
	            json = (JSONObject) json.get("body");
	            int count = json.get("totalCount") == null ? 0 : Integer.parseInt(json.get("totalCount").toString());

	            if (json.get("items") instanceof JSONObject) {
	                json = (JSONObject) json.get("items");
	            }
	            json.put("count", count);
	        } else {
	            // 오류 처리: xml_list() 메서드에서 null을 반환한 경우
	            // 예외 처리 또는 오류 로그 작성 등을 수행할 수 있습니다.
	            System.out.println("xml_list() 메서드가 null을 반환했습니다.");
	        }
	    } catch (Exception e) {
	        // 예외 처리: JSON 파싱 또는 다른 예외가 발생한 경우
	        // 예외 메시지를 로그에 기록하거나 적절한 오류 처리를 수행할 수 있습니다.
	        System.out.println("예외 발생: " + e.getMessage());
	    }

	    if (json != null) {
	        return json.toJSONString();
	    } else {
	        return "{}"; // 빈 JSON 객체를 반환하거나 다른 오류 처리를 수행할 수 있습니다.
	    }
	}
	
	public String makeUrl(Map<String, Object> map) {
		String url="";
		if(map.containsKey("itemName")){			
			map.put("itemName", URLEncoding(map.get("itemName").toString()));
			url = map.get("endpoint").toString()+"?serviceKey="+map.get("serviceKey").toString()
					+"&"+map.get("default").toString()+"&itemName="+map.get("itemName").toString();
		}else {
			url = map.get("endpoint").toString()+"?serviceKey="+map.get("serviceKey").toString()
					+"&"+map.get("default").toString();
			
		}
//		if(map.containsKey("typeName")) {
//			map.put("typeName", URLEncoding(map.get("typeName").toString()));
//		}else {
//			url = map.get("endpoint").toString()+"?"+map.get("infoMap").toString();
//		}
		
		return url;
	}
	
	public String callAPI(String urlString) {
		System.out.print(urlString);
		String body = "";
        try {
            // 외부 API의 엔드포인트 URL 설정
            URL url = new URL(urlString);

            // HttpURLConnection 객체 생성
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

            // 요청 방식 설정 (GET 요청)
            conn.setRequestMethod("GET");

            // 응답 코드 확인
            int responseCode = conn.getResponseCode();
            System.out.println("Response Code: " + responseCode);

            if (responseCode == HttpURLConnection.HTTP_OK) {
                // API 응답 데이터를 읽기 위한 BufferedReader 생성
                BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
                String inputLine;
                StringBuilder response = new StringBuilder();

                // 응답 데이터를 읽어서 StringBuilder에 저장
                while ((inputLine = in.readLine()) != null) {
                    response.append(inputLine);
                }
                in.close();

                // API 응답 출력
                System.out.println("API Response: " + response.toString());
                body = response.toString();
            } else {
                System.out.println("API Request Failed");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    
		
		return body;
	}
	public String URLEncoding(String korString) {
		String result="";
        try {
            // UTF-8로 URL 인코딩
            result = URLEncoder.encode(korString, "UTF-8");

            // 결과 출력
            System.out.println("인코딩된 문자열: " + result);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return result;
    }
	
	public JsonNode jsonStringToMap(String jsonString) {
		JsonNode resultMap = null;
		try {
			ObjectMapper objectMapper = new ObjectMapper();
            resultMap = objectMapper.readTree(jsonString);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
		return resultMap;
	}
	public List stringToArray (String jsonString) {
		List<Map<String, Object>> arrayList = new ArrayList<>();
		try {
            // ObjectMapper 초기화
            ObjectMapper objectMapper = new ObjectMapper();

            // JSON 문자열을 ArrayList로 파싱
            arrayList = objectMapper.readValue(jsonString, ArrayList.class);

            // ArrayList 내용 출력
            for (Object item : arrayList) {
                System.out.println("Item: " + item);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
		return arrayList;
	}
	public Object mapToBodyMap(JsonNode bodyMap) {
		List<Map<String, Object>> result = new ArrayList<>();
		Object body = bodyMap.get("body");
		return body;
		
	}
	
	public List<String> mainCallAPI(Map<String, Object> urlInfo) throws JsonProcessingException {
		String url = makeUrl(urlInfo);
		String response = callAPI(url);
		JsonNode bodyMap = jsonStringToMap(response);
		Object bodyMapString = mapToBodyMap(bodyMap);
		List<Map<String, Object>> resultList = new ArrayList<>();
		resultList = stringToArr(bodyMapString.toString());
//		System.out.print(resultList);
		List<String> result = new ArrayList<>();

		for(int i=0; i<resultList.size();i++) {
			result.add(resultList.get(i).get("ITEM_SEQ").toString());
		}
		return result;
	}
	public List stringToArr(String jsonString) {
//		List result = new ArrayList<>();
		ObjectMapper objectMapper = new ObjectMapper();
		// JSON 문자열을 Map으로 파싱
        Map<String, Object> data = new HashMap<>();
		try {
			data = objectMapper.readValue(jsonString, Map.class);
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

        // "items" 키의 값(배열)을 추출하여 리스트로 변환
        List<Map<String, Object>> items = (List<Map<String, Object>>) data.get("items");

        // 리스트 내용 출력
        for (Map<String, Object> item : items) {
            System.out.println("Item: " + item);
        }
        return items;
	}
	
	

}