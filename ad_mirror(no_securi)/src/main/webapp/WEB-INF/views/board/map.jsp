<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../includes/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76"
	href="../assets/img/apple-icon.png">
<link rel="icon" type="image/png" href="../assets/img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>Paper Dashboard 2 by Creative Tim</title>
<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
	name='viewport' />
<!--     Fonts and icons     -->
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200"
	rel="stylesheet" />

</head>
<style>
    .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}
    
</style>
<body class="">
	<div class="wrapper ">
		<div class="main-panel">
			<div class="content">
				<div class="row">
					<div class="col-md-12">
						<div class="card ">
 <div id="menu_wrap" class="bg_white">
        <div class="option">
            <div class="card-header" style="padding: 0px 15px 0;">
            <div class="pull-left"><h3 style="margin-bottom: auto; line-height: 2em;">Map</h3></div>
            <div class="pull-right">
                <form class="form-inline ml-auto" onsubmit="searchPlaces(); return false;">
									<div class="form-group no-border">
										<input type="text" id="keyword" value=""
											class="form-control" placeholder="주소를 입력하세요."
											onkeypress="if(event.keyCode==13 ){searchPlaces();}">
									</div>
									<button type="submit"
										class="btn btn-neutral btn-icon btn-round">
										<i class="nc-icon nc-zoom-split Isearch"></i>
									</button>
								</form>
   					         </div>
            			</div>
        				</div>
 					   	</div>   
							<div class="card-body" style="padding: 0px 15px 10px 15px;">
							<div class="map_wrap">
								<div id="map" style="width: 74vw; height: 70vh;"></div>
							</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<footer class="footer footer-black  footer-white ">
				<div class="container-fluid">
					<div class="row">
						<nav class="footer-nav">
							<ul>
								<li><a href="https://www.creative-tim.com" target="_blank">Creative
										Tim</a></li>
								<li><a href="http://blog.creative-tim.com/" target="_blank">Blog</a>
								</li>
								<li><a href="https://www.creative-tim.com/license"
									target="_blank">Licenses</a></li>
							</ul>
						</nav>
						<div class="credits ml-auto">
							<span class="copyright"> © <script>
								document.write(new Date().getFullYear())
							</script>, made with <i class="fa fa-heart heart"></i> by
								Creative Tim
							</span>
						</div>
					</div>
				</div>
			</footer>
		</div>
	</div>
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2cd6264b303cc61f79fe2f8cf8702941&libraries=services,clusterer,drawing"></script>
	<script>
		var container = document.getElementById('map');//지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center : new kakao.maps.LatLng(37.519866, 126.988407), //지도의 중심좌표.
			level : 7
		//지도의 레벨(확대, 축소 정도)
		};

		var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
		var imageSrc = 'http://localhost:8080/resources/img/AD_marker.png'; // 마커이미지의 주소입니다    

		// 마커를 표시할 위치와 title 객체 배열입니다 
		var positions = [ {
			title : '이촌역',
			latlng : new kakao.maps.LatLng(37.522231, 126.973332)
		}, {
			title : '동작역',
			latlng : new kakao.maps.LatLng(37.503020, 126.976273)
		}, {
			title : '노량진역',
			latlng : new kakao.maps.LatLng(37.513483, 126.942085)
		}, {
			title : '서빙고역',
			latlng : new kakao.maps.LatLng(37.519609, 126.988523)
		}, {
			title : '목동역',
			latlng : new kakao.maps.LatLng(37.525948, 126.863983)
		}, {
			title : '오목교역',
			latlng : new kakao.maps.LatLng(37.524759, 126.876146)
		}, {
			title : '보라매역',
			latlng : new kakao.maps.LatLng(37.499792, 126.920726)
		}
		];

		// 커스텀 오버레이에 표시할 컨텐츠 입니다
		// 커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
		// 별도의 이벤트 메소드를 제공하지 않습니다 
		var content = ['<div class="wrap">'
				+ '    <div class="info">'
				+ '        <div class="title">'
				+ '            이촌역'
				+ '            <div class="close" onclick="closeOverlay(0)" title="닫기"></div>'
				+ '        </div>'
				+ '        <div class="body">'
				+ '            <div class="img">'
				+ '                <img src="http://localhost:8080/resources/img/AD.png" width="73" height="70">'
				+ '           </div>'
				+ '            <div class="desc">'
				+ '                <div class="ellipsis">서울특별시 용산구 이촌동</div>'
				+ '                <div class="jibun ellipsis">(우) 17-79</div>'
				+ '                <div><a href="http://www.kakaocorp.com/main" target="_blank" class="link">관리자 page▶▶</a></div>'
				+ '            </div>' + '        </div>' + '    </div>'
				+ '</div>',
				'<div class="wrap">'
				+ '    <div class="info">'
				+ '        <div class="title">'
				+ '            동작역'
				+ '            <div class="close" onclick="closeOverlay(1)" title="닫기"></div>'
				+ '        </div>'
				+ '        <div class="body">'
				+ '            <div class="img">'
				+ '                <img src="http://localhost:8080/resources/img/AD.png" width="73" height="70">'
				+ '           </div>'
				+ '            <div class="desc">'
				+ '                <div class="ellipsis">서울특별시 동작구 동작동</div>'
				+ '                <div class="jibun ellipsis">(우) 203-3</div>'
				+ '                <div><a href="http://www.kakaocorp.com/main" target="_blank" class="link">관리자 page▶▶</a></div>'
				+ '            </div>' + '        </div>' + '    </div>'
				+ '</div>',
				'<div class="wrap">'
				+ '    <div class="info">'
				+ '        <div class="title">'
				+ '            노량진역'
				+ '            <div class="close" onclick="closeOverlay(2)" title="닫기"></div>'
				+ '        </div>'
				+ '        <div class="body">'
				+ '            <div class="img">'
				+ '                <img src="http://localhost:8080/resources/img/AD.png" width="73" height="70">'
				+ '           </div>'
				+ '            <div class="desc">'
				+ '                <div class="ellipsis">서울특별시 동작구 노량진동</div>'
				+ '                <div class="jibun ellipsis">(우) 70-4</div>'
				+ '                <div><a href="http://www.kakaocorp.com/main" target="_blank" class="link">관리자 page▶▶</a></div>'
				+ '            </div>' + '        </div>' + '    </div>'
				+ '</div>',
				'<div class="wrap">'
				+ '    <div class="info">'
				+ '        <div class="title">'
				+ '            서빙고역'
				+ '            <div class="close" onclick="closeOverlay(3)" title="닫기"></div>'
				+ '        </div>'
				+ '        <div class="body">'
				+ '            <div class="img">'
				+ '                <img src="http://localhost:8080/resources/img/AD.png" width="73" height="70">'
				+ '           </div>'
				+ '            <div class="desc">'
				+ '                <div class="ellipsis">서울특별시 용산구 서빙고동</div>'
				+ '                <div class="jibun ellipsis"></div>'
				+ '                <div><a href="http://www.kakaocorp.com/main" target="_blank" class="link">관리자 page▶▶</a></div>'
				+ '            </div>' + '        </div>' + '    </div>'
				+ '</div>',
				'<div class="wrap">'
				+ '    <div class="info">'
				+ '        <div class="title">'
				+ '            목동역'
				+ '            <div class="close" onclick="closeOverlay(2)" title="닫기"></div>'
				+ '        </div>'
				+ '        <div class="body">'
				+ '            <div class="img">'
				+ '                <img src="http://localhost:8080/resources/img/AD.png" width="73" height="70">'
				+ '           </div>'
				+ '            <div class="desc">'
				+ '                <div class="ellipsis">서울특별시 양천구 신정동</div>'
				+ '                <div class="jibun ellipsis">(우) 994-15</div>'
				+ '                <div><a href="http://www.kakaocorp.com/main" target="_blank" class="link">관리자 page▶▶</a></div>'
				+ '            </div>' + '        </div>' + '    </div>'
				+ '</div>',
				'<div class="wrap">'
				+ '    <div class="info">'
				+ '        <div class="title">'
				+ '            오목교역'
				+ '            <div class="close" onclick="closeOverlay(2)" title="닫기"></div>'
				+ '        </div>'
				+ '        <div class="body">'
				+ '            <div class="img">'
				+ '                <img src="http://localhost:8080/resources/img/AD.png" width="73" height="70">'
				+ '           </div>'
				+ '            <div class="desc">'
				+ '                <div class="ellipsis">서울특별시 양천구 목동</div>'
				+ '                <div class="jibun ellipsis">(우) 406-29</div>'
				+ '                <div><a href="http://www.kakaocorp.com/main" target="_blank" class="link">관리자 page▶▶</a></div>'
				+ '            </div>' + '        </div>' + '    </div>'
				+ '</div>',
				'<div class="wrap">'
				+ '    <div class="info">'
				+ '        <div class="title">'
				+ '            보라매역'
				+ '            <div class="close" onclick="closeOverlay(2)" title="닫기"></div>'
				+ '        </div>'
				+ '        <div class="body">'
				+ '            <div class="img">'
				+ '                <img src="http://localhost:8080/resources/img/AD.png" width="73" height="70">'
				+ '           </div>'
				+ '            <div class="desc">'
				+ '                <div class="ellipsis">서울특별시 동작구 대방동</div>'
				+ '                <div class="jibun ellipsis">(우) 400-10</div>'
				+ '                <div><a href="http://www.kakaocorp.com/main" target="_blank" class="link">관리자 page▶▶</a></div>'
				+ '            </div>' + '        </div>' + '    </div>'
				+ '</div>'
				];

		var overlays = [];
		for (var i = 0; i < positions.length; i++) {
			var imageSize = new kakao.maps.Size(22, 26), // 마커이미지의 크기입니다

			// 마커 이미지를 생성합니다    
			markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
				map : map, // 마커를 표시할 지도
				position : positions[i].latlng, // 마커를 표시할 위치
				title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
				image : markerImage	// 마커 이미지 
			});
			
			// 마커 위에 커스텀오버레이를 표시합니다
			// 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
			var overlay = new kakao.maps.CustomOverlay({
				content : content[i],
				map : map,
				position : positions[i].latlng, // 마커를 표시할 위치
			});
			overlays.push(overlay);
		    kakao.maps.event.addListener(marker, 'click', openOverlay(map, marker, overlay));
		    overlay.setMap(null);
		}
		
		function openOverlay(map, marker, overlay) {
		    return function() {
		    	console.log(overlay);
		    	overlay.setMap(map);
		    };
		}

		function closeOverlay(map, marker, overlay) {
		    return function() {
		    	overlay.setMap(null);
		    };
		}

		 // 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
		function closeOverlay(idx) {
			overlays[idx].setMap(null);
			console.log(overlays[idx]);
		} 
		 
		// 장소 검색 객체를 생성합니다
		var ps = new kakao.maps.services.Places(); 

		// 키워드 검색을 요청하는 함수입니다
		function searchPlaces() {

		    var keyword = document.getElementById('keyword').value;

		    if (!keyword.replace(/^\s+|\s+$/g, '')) {
		        alert('키워드를 입력해주세요!');
		        return false;
		    }
		    
		    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
		    ps.keywordSearch( keyword, placesSearchCB); 
		}
		
		// 키워드로 장소를 검색합니다
		ps.keywordSearch(keyword, placesSearchCB); 

		// 키워드 검색 완료 시 호출되는 콜백함수 입니다
		function placesSearchCB (data, status, pagination) {
		    if (status === kakao.maps.services.Status.OK) {
		    	
		        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
		        // LatLngBounds 객체에 좌표를 추가합니다
		        var bounds = new kakao.maps.LatLngBounds();
		        
		        for (var i=0; i<data.length; i++) {
		            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
		        }
		        
		        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
		        map.setBounds(bounds);
		    } 
		}
	</script>
</body>
</html>
