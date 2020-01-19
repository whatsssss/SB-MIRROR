<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../includes/header.jsp"%>

      <!-- argon -->
  <!-- CSS Files -->
  <link href="/resources/argon/assets/css/argon-dashboard.css?v=1.1.0" rel="stylesheet" />
<!-- Favicon -->
<link href="/resources/argon/assets/img/brand/favicon.png" rel="icon" type="image/png">
<!-- Fonts -->
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
<!-- Icons -->
<link href="/resources/argon/assets/js/plugins/nucleo/css/nucleo.css" rel="stylesheet" />
<link href="/resources/argon/assets/js/plugins/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet" />
<style>
.header1{
   grid-area: header;
 }
  
 .leftCol1{
   grid-area: leftCol;
 }
  
 .rightCol1{
   grid-area: rightCol;
 }
  
  .midTop1{
   grid-area: midTop;
   ;
 }
  
 .midBottom1{
   grid-area: midBottom;
 }
  
 .footer1{
   grid-area: footer;
 }
 
.content{
  display: grid;
  grid-template-columns: 1fr 1fr 1fr;
  grid-template-rows: 50px 370px 50px auto;
  grid-template-areas:
  "header header header "
  "leftCol leftCol midTop "
  "footer footer  footer"
  "rightCol rightCol midBottom ";
  grid-gap: 5px;
}

.breadcrumb {
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -ms-flex-wrap: wrap;
  flex-wrap: wrap;
  list-style: none;
  background-color: lightgrey;
  border-radius: 0.25rem;
}

.content{
  margin-top: 15px;
}

.rightCol1 {
  display: grid;
  grid-template-columns: 50% 50%;
  grid-template-rows: 184px 184px;
  grid-template-areas:
  "area1 area2 "
  "area3 area4 ";
  grid-gap: 5px;
  margin-right: 5px;
}

.area1{
  grid-area: area1;
  background-color: white;
  border-radius: 0.375rem;
}

.area2{
  grid-area: area2;
  background-color: white;
  border-radius: 0.375rem;
}

.area3{
  grid-area: area3;
  background-color: white;
  border-radius: 0.375rem;
}

.area4{
  grid-area: area4;
  background-color: white;
  border-radius: 0.375rem;
}

</style>

<div class="main-panel">
      <!-- Navbar -->
      <!-- End Navbar -->
      <!-- <div class="panel-header panel-header-lg">
  <canvas id="bigDashboardChart"></canvas>

</div> -->
      <div class="content" style="margin-top: 15px;">
        
          <div class="header1" style=" box-shadow: 0 6px 10px -4px rgba(0, 0, 0, 0.15);" >
            <ol class="breadcrumb" style="background : linear-gradient(87deg, #5e72e4 0, #825ee4 100%) !important; margin-bottom: 0em ">
            <li class="breadcrumb-item">
              <a href="#" style="color: azure">광고 현황</a>
            </li>
            <li class="breadcrumb-item active" style="color: azure">Overview</li>
          </ol>
        </div>
          <div class="leftCol1" style=" box-shadow: 0 6px 10px -4px rgba(0, 0, 0, 0.15);"><div class="card shadow" style="height: 370px;  ">
              <div class="card-header border-0">
                <div class="row align-items-center">
                  
                </div>
              </div>
              <div class="table-responsive" style=" overflow-y: hidden ">
                <!-- Projects table -->
                <table class="table align-items-center table-flush">
                  <thead class="thead-light">
                    <tr>
                      <th scope="col">광고명</th>
                      <th scope="col">금일 상영수</th>
                      <th scope="col">누적 상영수</th>
                      <th scope="col">상영 비율</th>
                    </tr>
                  </thead>
                  <tbody>
                  <c:forEach items="${ad}" var="ad">
                    <tr>
                      <th scope="row"><c:out value="${ad.adname}" /></th>
                      <td><c:out value="${ad.todayview}" /></td>
                      <td><c:out value="${ad.totalview}" /></td>
                      <td><c:if test="${ad.viewlate >= 3000}">
                       <i class="fas fa-arrow-up text-success mr-3"></i>
                      </c:if>
                      <c:if test="${ad.viewlate < 3000}">
                       <i class="fas fa-arrow-down text-warning mr-3"></i>
                      </c:if>
                       <c:out value="${ad.viewlate/100}%" /></td>
                    </tr> 
                   </c:forEach>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
          <div class="rightCol1">
            <div class="area1" style=" box-shadow: 0 6px 10px -4px rgba(0, 0, 0, 0.15);">
              <div class="card-body">
                <div class="row">
                  <div class="col">
                    <h5 class="card-title text-uppercase text-muted mb-0">어제 방문자 수</h5>
                    <span class="h2 font-weight-bold mb-0">${cus.day_visit}</span>
                  </div>
                  <div class="col-auto">
                    <div class="icon icon-shape bg-danger text-white rounded-circle shadow">
                      <i class="fas fa-chart-bar"></i>
                    </div>
                  </div>
                </div>
                <p class="mt-3 mb-0 text-muted text-sm">
                  <span class="text-success mr-2"><i class="fa fa-arrow-up"></i> 3.48%</span>
                  <span class="text-nowrap">Since last day</span>
                </p>
              </div>
            </div>
            <div class="area2" style=" box-shadow: 0 6px 10px -4px rgba(0, 0, 0, 0.15);">
              <div class="card-body">
                <div class="row">
                  <div class="col">
                    <h5 class="card-title text-uppercase text-muted mb-0">이번 주 누적 방문자 수</h5>
                    <span class="h2 font-weight-bold mb-0">${cus.week_visit}</span>
                  </div>
                  <div class="col-auto">
                    <div class="icon icon-shape bg-warning text-white rounded-circle shadow">
                      <i class="fas fa-chart-pie"></i>
                    </div>
                  </div>
                </div>
                <p class="mt-3 mb-0 text-muted text-sm">
                  <span class="text-danger mr-2"><i class="fas fa-arrow-down"></i> 3.48%</span>
                  <span class="text-nowrap">Since last week</span>
                </p>
              </div>
            </div>
            <div class="area3" style=" box-shadow: 0 6px 10px -4px rgba(0, 0, 0, 0.15);">
              <div class="card-body">
                <div class="row">
                  <div class="col">
                    <h5 class="card-title text-uppercase text-muted mb-0">이번 달 누적 방문자 수</h5>
                    <span class="h2 font-weight-bold mb-0">${cus.month_visit}</span>
                  </div>
                  <div class="col-auto">
                    <div class="icon icon-shape bg-yellow text-white rounded-circle shadow">
                      <i class="fas fa-users"></i>
                    </div>
                  </div>
                </div>
                <p class="mt-3 mb-0 text-muted text-sm">
                  <span class="text-warning mr-2"><i class="fas fa-arrow-down"></i> 1.10%</span>
                  <span class="text-nowrap">Since last month</span>
                </p>
              </div>
            </div>
            <div class="area4" style=" box-shadow: 0 6px 10px -4px rgba(0, 0, 0, 0.15);">
              <div class="card-body">
                <div class="row">
                  <div class="col">
                    <h5 class="card-title text-uppercase text-muted mb-0">총 누적 방문자 수</h5>
                    <span class="h2 font-weight-bold mb-0">${cus.total_visit}</span>
                  </div>
                  <div class="col-auto">
                    <div class="icon icon-shape bg-info text-white rounded-circle shadow">
                      <i class="fas fa-percent"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="midTop1">
            <div class="card shadow" style="height: 370px">
            <div class="card-header bg-transparent">
              <div class="row align-items-center">
                <div class="col">
                  <h2 class="mb-0">광고 상영 Overview</h2>
                </div>
              </div>
            </div>
            <div class="card-body" >
              <!-- Chart -->
              <div class="chart" style="height: 280px" >
                <canvas id="chart-orders" class="chart-canvas"></canvas>
              </div>
            </div>
          </div></div>
          <div class="midBottom1">
                  <div class="card mb-3" style=" height: 370px;">
                    <div class="card-header">
                      <i class="fas fa-chart-pie"></i>
                    	 연령별 방문자 분포 차트
                      <ul style="float: right; display: flex; list-style: none">
                        <li style="padding-right: 1em">
                          <button class="btn btn-primary btn-sm" style="width: 80px;">남자</button>
                        </li>
                        <li>
                            <button class="btn btn-primary
                             btn-sm" style="float: right; width: 80px; " >여자</button>
                        </li>
                      </ul>
                      </div>
                    <div class="card-body"  style="width: 500px; " >
                      <canvas id="myPieChart"  ></canvas>
                    </div>
                  </div>
        </div>
          <div class="footer1">
              <ol class="breadcrumb" style="background : linear-gradient(87deg, #5e72e4 0, #825ee4 100%) !important; margin-bottom: 0em ">
                  <li class="breadcrumb-item">
                    <a href="#" style="color: azure">고객 현황</a>
                  </li>
                  <li class="breadcrumb-item active" style="color: azure">연령별 방문자 분포 차트</li>
                </ol>
          </div>
      </div>
    </div>
    
  <!-- argon -->
    <!--   Core   -->
    <script src="/resources/argon/assets/js/plugins/jquery/dist/jquery.min.js"></script>
    <script src="/resources/argon/assets/js/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <!--   Optional JS   -->
    <script src="/resources/argon/assets/js/plugins/chart.js/dist/Chart.min.js"></script>
    <script src="/resources/argon/assets/js/plugins/chart.js/dist/Chart.extension.js"></script>
    <!--   Argon JS   -->
    <script src="https://cdn.trackjs.com/agent/v3/latest/t.js"></script>
    <script src="/resources/argon/assets/js/argon-dashboard.js"></script>
    <!-- Page level plugin JavaScript-->
    <script src="/resources/admin/vendor/chart.js/Chart.min.js"></script>
    <script src="/resources/admin/js/demo/chart-pie-demo.js"></script>
  
</body>
</html>
