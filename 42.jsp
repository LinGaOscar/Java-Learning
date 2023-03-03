<%@ page session="false" contentType="text/html; charset=utf-8" language="java" errorPage="" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.tstartel.com/CWS/tag" prefix="p"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!-- 服務據點 google 地圖元件 -->
<p:attrs id="rwd_s_042" />
<c:set var="attr" value="${attrs[0]}" />
<link type="text/css" rel="stylesheet" href="resources/rwd_s_042/css/style-store.css">
<link rel="stylesheet" type="text/css" href="resources/common/css/jquery.loadingModal.css">
<script type="text/javascript" src="resources/common/js/jquery.loadingModal.min.js"></script>
<script type="text/javascript" src="resources/common/js/vue-2.3.3.js"></script>
<script type="text/javascript" src="resources/rwd_s_042/js/scroll.js"></script>
<script type="text/javascript" src="//maps.googleapis.com/maps/api/js?<c:if test="${not empty attr.t4}">key=${attr.t4}</c:if>"></script>

<!--服務據點(增加友善設置)-元件開始 -->
<section id="wrapper" data-whatPage="style-store">
	<section class="content">
		<div class="tsContent justifyContent" style="background-color: #f8f8f8;">
			<div class="main" data-maxWidth="false">
				<!-- google map -->
				<div class="googleMap" id="googleMap"></div>
				<!-- google map end -->
			</div>
		</div>

		<div class="tsContent justifyContent" style="background-color: #f8f8f8;">
			<div class="main" data-maxWidth="true">
				<!-- search -->
				<div class="selectContent">
					<form>
						<span>請透過下拉選單選擇縣市與地區：</span> 
						<select id="city" name="city" v-model="city" @change="getZip(city);getServerLocation(city,'','');gaEvent('選擇縣市')">
							<option v-for="cityOption in cityOptions" disable value="" :value="cityOption.city">{{cityOption.city}}</option>
						</select> 
						<select id="zip" name="zip" v-model="zip" @change="getServerLocation(city,zip,address);gaEvent('選擇地區')">
							<option v-for="zipOption in zipOptions" disable value="" :value="zipOption.district">{{zipOption.district}}</option>
						</select> 
						<input id="address" name="address" type="text" placeholder="搜尋地址" v-model="address" @blur="gaEvent('選擇地址')"> 
						<select id="barrier" name="barrier"	v-model="barrier">
							<option v-for="barrierOption in barrierOptions" disable value="" :value="barrierOption">{{barrierOption}}</option>
						</select>
						<button type="submit" @click.prevent="getServerLocation(city,zip,address);gaEvent('查詢店點送出按鈕')">查 詢</button>
					</form>
				</div>
				<!-- search end -->

				<div class="searchContent">
					<!-- list table 表頭 -->
					<ul id="tableTitle" class="list table" data-caption="true">
						<li class="caption">{{city}} {{zip}}</li>
						<li class="thead">
							<ul>
								<li>店點名稱</li>
								<li>地 址 / 電 話</li>
								<li>營業時間</li>
								<li>動作</li>
							</ul>
						</li>
					</ul>
					<!-- list table 表頭 end -->

					<!-- store info -->
					<ul id="tableConent" class="list table">
						<!-- loading action -->
						<li class="tbody" v-for="serverLocation in serverLocations">
							<ul>
								<li><span class="storeTag" data-storetag="direct">{{serverLocation.storeType | formatStoreType}}</span>
								 	{{serverLocation.locationName}}
									&nbsp;&nbsp;
									<div style="display:flex;" class="barrier_location">
										<!-- 服務鈴 -->	
										<p v-if="serverLocation.Service_Bell=='Y'">
											<!-- 服務鈴+活動斜坡 -->
											<img v-if="serverLocation.Activity_Ramp=='Y'"
												src="/resources/rwd_s_042/images/activity_ramp.png" />
											<!-- 服務鈴+平坦入口 -->
											<img v-else-if="serverLocation.Flat_Entrance=='Y'"
												src="/resources/rwd_s_042/images/service_bell_flat_entrance.png" />
											<!-- 服務鈴+既有斜坡 -->
											<img v-else-if="serverLocation.Existing_Slope=='Y'" 
												src="/resources/rwd_s_042/images/existing_slope.png" />
											<!-- 只有服務鈴 -->	
											<img v-else	src="/resources/rwd_s_042/images/service_bell.png" />
										</p>
										<!-- 只有平坦斜坡 -->
										<p v-else-if="serverLocation.Flat_Entrance=='Y'">
											<img src="/resources/rwd_s_042/images/flat_entrance.png" />
										</p>
									</div>
								</li>
								<li>{{serverLocation.storeAddress}}<br>{{serverLocation.phoneNumber}}
								</li>
								<li>{{serverLocation.operateTime}}</li>
								<li><a :href="'tel:'+serverLocation.phoneNumber" class="btnStyleModel6"> <img src="/resources/common/mobile/css/images/icon/tel.png"
										alt="聯絡門市" title="" style="width: 15px">聯絡門市
								</a> <a :href="'https://www.google.com/maps/dir//'+serverLocation.latlng" class="btnStyleModel6" target="_blank"> <img
										src="/resources/common/mobile/css/images/icon/map.png" alt="規劃路線" title="">規劃路線
								</a></li>
							</ul>
						</li>
						<li class="tbody" v-if="serverLocations.length == 0">
						親愛的客戶，您好，由於您所選擇的地區台灣之星門市正陸續建置中，可請您聯繫客服查詢鄰近您區域之門市，24小時服務專線0908-000123，謝謝。
						</li>
						<!-- loading action end -->
					</ul>
					<!-- store info end -->
				</div>

				<!-- 注意事項 設定為0時不顯示 -->
				<div class="notes" <c:if test="${not empty attr.t2 && attr.t2 == 0}">style="display: none;"</c:if>>
					<div class="notesTitle">${attr.t1}</div>
					<div class="notesContent">
						<p:htmlOut text="${attr.h1}" />
					</div>
				</div>
			</div>
		</div>
	</section>
</section>

<script language="javascript">
$('body').loadingModal({'animation': 'fadingCircle'});
	let app = new Vue({
		el : '#wrapper',
		data : {
			city : "",
			cityOptions : [],
			zip : "",
			zipOptions : [{district:"請先選擇地區"}],
			address : "",
			serverLocationTemp :[],
			barrier : "",
			barrierOptions : [
					"請下拉選擇無障礙設施", "服務鈴", "服務鈴+活動斜坡", "服務鈴+既有斜坡", "服務鈴+平坦入口", "平坦入口"
			],
	        nowSetIcon : '<p:base/>/resources/rwd_s_042/images/current_location.png',
	        storeIcon : '<p:base/>/resources/rwd_s_042/images/TS.png',
		},
		computed : {
			//店點清單
			serverLocations() {
				if(!this.serverLocationTemp){
					return;
				}
				
				return this.serverLocationTemp?.filter(location => {
					//服務鈴
					switch (this.barrier) {
					case this.barrierOptions[1]:
						if(location.Service_Bell=="Y"){
							return location;
						}
						break;
					//服務鈴+活動斜坡
					case this.barrierOptions[2]:
						if(location.Service_Bell=="Y" && location.Activity_Ramp=="Y"){
							return location;
						}
					break;
					//服務鈴+既有斜坡
					case this.barrierOptions[3]:
						if(location.Service_Bell=="Y" && location.Existing_Slope=="Y"){
							return location;
						}
						break;
					//服務鈴+平坦入口
					case this.barrierOptions[4]:
						if(location.Service_Bell=="Y" && location.Flat_Entrance=="Y"){
							return location;
						}
						break;
					//平坦入口	
					case this.barrierOptions[5]:
						if(location.Flat_Entrance=="Y"){
							return location;
						}
						break;
					default:
						return location;
						break;
					}
				});
			}
		},
		watch: {
			serverLocations(){
				this.resetMap();
				if(!this.serverLocations){
					 let myGeocoder = new google.maps.Geocoder();
	                 myGeocoder.geocode({address: this.city + this.zip}, (results, status) => {
	                     if (status === google.maps.GeocoderStatus.OK) {
	                         map.setCenter(results[0].geometry.location);
	                         map.setZoom(15);
	                     }
	                 });
					
					return;
				}
				
				
				//設定地圖畫面 第一個店點
				let [lat,lng] = this.serverLocations[0].latlng.split(',');
				pos = {	lat: parseFloat(lat), lng: parseFloat(lng)};
	    		map.setCenter(pos);
	    		
				//設定地圖標的
				this.serverLocations.forEach( location => {
					let [lat,lng] = location.latlng.split(',');
					pos = {lat: parseFloat(lat), lng: parseFloat(lng)};
					
					let marker = new google.maps.Marker({
		                position: pos,
		                map: map,
		                icon: this.storeIcon,
		                title: location.title
		            });
					
					let infoWindow = new google.maps.InfoWindow;
					//設定地圖上店點內容
					google.maps.event.addListener(marker, "click", function (e) {
	               	
						infoWindow.setContent('<h3 style="color: #87286E; font-size:1.3em; margin-bottom: 5px !important;">' + 
								location.locationName + '</h3><span style="color:#000; font-size:1.1em;">' + location.storeAddress + '</span>');
						infoWindow.open(map,marker)
	                });
				});
			}
		},
		filters:{
			formatStoreType:function(value){
				if (value =="0"){
					return "直營";
				}else{
					return "特約";
				}
			}
		},
		methods : {
			//取得縣市
	    	getCity(){
				$("body").loadingModal('show');
			
				$.get('<p:base/>/rest/zipCode/allCity/')
				.done(cityList => {
					this.cityOptions=[{city:"請選擇縣市"}];
					this.cityOptions=this.cityOptions.concat(cityList);
	            	this.city=this.cityOptions[0].city;
				})
				.fail(resp => {
	            	//連線不到回首頁
	            	alert("系統忙碌中,請稍後再試!");
	        		document.location="https://www.tstartel.com/CWS";
	            });
				
	    		$("body").loadingModal('hide');
	    	},
	    	//取得地區
	    	getZip(city) {
	    		if(city.includes("選擇")){
    				return;
    			}
	    		$("body").loadingModal('show');
	    		
				$.get('<p:base/>/rest/zipCode/' + encodeURIComponent(city))
		 		 .done(zipList => {
		 			 this.zipOptions=[{district:"請先選擇地區"}];
		 			 this.zipOptions=this.zipOptions.concat(zipList);
		 			 this.zip=this.zipOptions[0].district;
		 		 })
		 		 .fail(resp => {
		 			 //連線不到回首頁
		 			 alert("系統忙碌中,請稍後再試!");
		 			 //document.location="https://www.tstartel.com/CWS";
		 		 });
    			
    			$("body").loadingModal('hide');
    			
			},
			//取得店點
			getServerLocation(city,zip,address){
				if (city.includes("選擇")){
					city="";
				}
				if (zip.includes("選擇") || zip.includes("-")){
					zip="";
				}
				if (!city && !zip && !address){
					return;
				}
				$("body").loadingModal('show');
				
				$.get('<p:base/>/rest/serviceLocation/getServiceLocationByAddress/' + encodeURIComponent(city+zip+address))
	    		 .done(serverLocationList => {
	    			 this.serverLocationTemp = [];
	    			 if(serverLocationList){
	    				 this.serverLocationTemp = serverLocationList.resultData;
	    			 }
	    		})
	    		 .fail(resp => {
	    			 //連線不到回首頁
	    			 alert("系統忙碌中,請稍後再試!");
	    			 document.location="https://www.tstartel.com/CWS";
	    		});
				$("body").loadingModal('hide');
			},
			//由座標取得店點
			getServerLocationByLatitudeAndLongitude(pos) {
			
				$("body").loadingModal('show');
				
				let radius = 5;
		        $.get('<p:base/>' + '/rest/serviceLocation/getNearSrvLctByLatiLongi?' + 
		        		'latitude=' + pos.lat + '&longitude=' + pos.lng + '&radius=' + radius,)
		            .done((serverLocationList) => {
		            	this.serverLocationTemp = serverLocationList;
		            })
		            .fail(err => {
		                alert('系統忙碌中，請稍候再試！');
		            })
		            
		        $("body").loadingModal('hide');
		    },
		    //重設地圖
		    resetMap(){
				
		    	map = new google.maps.Map(document.getElementById('googleMap'), {
		            zoom: 15,
		            mapTypeId: 'roadmap',
		            streetViewControl: false
		        });
		    	
				//地標
		    	marker = new google.maps.Marker({
		    		icon: this.nowSetIcon,
		    		map: map
		    	});
		    },
		    //初始化地圖
			initMap(){
				this.resetMap();
		    	infowindow = new google.maps.InfoWindow;
				// Try HTML5 geolocation.
		        if (navigator.geolocation) {
		            navigator.geolocation.getCurrentPosition(position=> {
		            	pos = {
		            			lat: position.coords.latitude,
		            			lng: position.coords.longitude
		            	};
		            	// 設定電腦位置座標
		            	marker.setPosition(pos);
		            	this.getServerLocationByLatitudeAndLongitude(pos);
		              },err=>{
		            	  //讀取錯誤預設地點
		            	  this.getServerLocation("台北市","信義區","");
		              });
		        }else {
		        	//不支援網頁GPS預設地點
		        	this.getServerLocation("台北市","信義區","");
		        }
			},
			// 發送GA事件
		    gaEvent(label) {
		        ga('send', 'event', 'storeLocation', 'page_click', label);
		    },
		},
		mounted (){
			this.$nextTick(function () {
				this.getCity();
				
				//vue life cycle needed replace selection
				this.barrier=this.barrierOptions[0];
				this.zip=this.zipOptions[0].district;
			  
				this.initMap();
			})
		}
	})
</script>
<!-- 服務據點-元件結束 -->
