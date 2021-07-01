package com.callor.book.service.impl.movie;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Service;

import com.callor.book.config.NaverQualifier;
import com.callor.book.config.NaverSecret;
import com.callor.book.model.MovieDTO;
import com.callor.book.service.NaverAbstractService;
import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.google.gson.reflect.TypeToken;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service(NaverQualifier.NAVER_MOVIE_SERVICE_V1)
public class NaverMovieServiceImplV1 extends NaverAbstractService<MovieDTO>{
	
	@Override
	public String queryURL(String search) throws UnsupportedEncodingException {
		
		String searchUTF8 = null ;
		
		searchUTF8 = URLEncoder.encode(search,"UTF-8");
		
		String queryURL = NaverSecret.NURL.MOVIE ;
		queryURL += "?query=" + searchUTF8;
		queryURL += "&display=" + 10;

		return queryURL;
	}

	
	@Override
	public List<MovieDTO> getNaverList(String jsonString) throws ParseException {

		JsonElement jsonElement = JsonParser.parseString(jsonString);
		JsonElement oItems = jsonElement.getAsJsonObject().get("items");
		Gson gson = new Gson();
		
		TypeToken<List<MovieDTO>> typeToken = new TypeToken<List<MovieDTO>> () {};
		
		List<MovieDTO> movieList = gson.fromJson(oItems,typeToken.getType()) ;
		
		return movieList;
		
		
//		JSONParser jParser = new JSONParser();
//		JSONObject jObject = (JSONObject) jParser.parse(jsonString);
//		JSONArray items = (JSONArray) jObject.get("items");
//		
//		List<MovieDTO> movieList = new ArrayList<MovieDTO>();
//		
//		int nSize = items.size();
//		
//		for(int i = 0 ; i < nSize ; i ++ ) {
//			JSONObject item = (JSONObject) items.get(i);
//			
//			String title = item.get("title").toString();
//			String link = item.get("link").toString();
//			String image = item.get("image").toString();
//			String subtitle = item.get("subtitle").toString();
//			String pubDate = item.get("pubDate").toString();
//			String director = item.get("director").toString();
//			String actor = item.get("actor").toString();
//			String userRating = item.get("userRating").toString();
//			
//			MovieDTO movieDTO = MovieDTO.builder()
//					.title(title).link(link).image(image).subtitle(subtitle)
//					.pubDate(pubDate).director(director).
//					actor(actor).userRating(userRating).build();
//			
//			movieList.add(movieDTO);
//		}
//		return movieList;
	}

}
