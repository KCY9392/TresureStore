<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
 <script type="text/javascript" src="/tresure/resources/js/header.js"></script>

 <style>
 .main-section{
   
    -webkit-box-pack: center;
    justify-content: center;
    background: rgb(255, 255, 255);
    padding-top: 50px;
    padding-left: 400px;
    padding-right: 70px;
    /* margin-right: 150px; */
   

    }
    
    .content2{
    display: flex;
    
  
    
}

.profile{
   
}
.profile-image{
    border: grey solid 1px;
    width: 200px;
    height: 200px;
    margin-top: 20px;
    margin-left: 40px;
    margin-right: 20px;
}
.market-grade{
    font-size: 11px;
    margin-left: 112px;
    
    text-decoration: underline;

}


.info{
    
}
.info-table{
   
    flex: 1 0 0%;
    padding: 0px 30px;
    
    
    display: flex;
    height: 310px;
    flex-direction: column;
}
.market-name {
    display: flex;
    -webkit-box-align: center;
    align-items: center;
}




.info-list{
    
    height: 45px;
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    border-top: 1px solid rgb(250, 250, 250);
    border-bottom: 1px solid rgb(250, 250, 250);
    margin-bottom: 20px;
    flex-shrink: 0;


}

.market-open{

    margin-right: 30px;
    font-size: 13px;
    color: rgb(136, 136, 136);
    display: flex;
}
.market-opendate{
    margin-left: 5px;
    color: rgb(33, 33, 33);
    
}

.follower{
    margin-right: 30px;
    font-size: 13px;
    color: rgb(136, 136, 136);
    display: flex;

}

.market-follower{
    margin-left: 5px;
    color: rgb(33, 33, 33);

}
.sell-product{
    margin-right: 30px;
    font-size: 13px;
    color: rgb(136, 136, 136);
    display: flex;

}

.market-sell{
    margin-left: 5px;
    color: rgb(33, 33, 33);

}

.report{

    margin-right: 0px;
    font-size: 13px;
    color: rgb(136, 136, 136);
    display: flex;
}
.market-report{

    margin-left: 5px;
    color: rgb(33, 33, 33);
}

.button-area1{

    height: 56px;
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    flex-shrink: 0;
    flex-direction: row-reverse;
    


}
.button-area2{


display: flex;
-webkit-box-align: center;
align-items: center;
flex-shrink: 0;
flex-direction: row-reverse;



}

.following-list{

    height: 20px;
    display: flex;
    align-items: center;
   
    color:black;
    border: 1px solid gold;
    background-color: gold;
    font-size: 11px;
    border-radius: 15px;
}

.Withdrawal{
    height: 20px;
    display: flex;
   
    align-items: center;
    padding: 0px 1px;
    color: rgb(136, 136, 136);
   
    font-size: 11px;
}

.navi-list{
            list-style-type: none;/* ul속성 없애줌*/
            margin: 0;
            padding :0;
            height: 100%;

        }
        .navi-list>li{
            float: left;
            width: 15%;
            height: 100%;
            text-align: center;
        }
        .navi-list a{
            text-decoration: none;
            color :black;
            font-size: 14px;
            font-weight: 600;
            width: 100%;
            height: 100%;
            display: block;
            line-height: 35px;
            transform: scale(1)

        }
        .market-product{
            flex: 1 1 0%;
    -webkit-box-align: center;
    align-items: center;
    -webkit-box-pack: center;
    justify-content: center;
    display: flex;
    border-top: 1px solid rgb(238, 238, 238);
    border-right: 1px solid rgb(238, 238, 238);
    border-bottom: 1px solid rgb(33, 33, 33);
    background: rgb(250, 250, 250);
    color: rgb(136, 136, 136);
            
        }
        .market-review{
            flex: 1 1 0%;
    -webkit-box-align: center;
    align-items: center;
    -webkit-box-pack: center;
    justify-content: center;
    display: flex;
    border-top: 1px solid rgb(238, 238, 238);
    border-right: 1px solid rgb(238, 238, 238);
    border-bottom: 1px solid rgb(33, 33, 33);
    background: rgb(250, 250, 250);
    color: rgb(136, 136, 136);
}
        
        .market-heart{
           flex: 1 1 0%;
    -webkit-box-align: center;
    align-items: center;
    -webkit-box-pack: center;
    justify-content: center;
    display: flex;
    border-top: 1px solid rgb(238, 238, 238);
    border-right: 1px solid rgb(238, 238, 238);
    border-bottom: 1px solid rgb(33, 33, 33);
    background: rgb(250, 250, 250);
    color: rgb(136, 136, 136);
        }
        .market-tracsac{
          flex: 1 1 0%;
    -webkit-box-align: center;
    align-items: center;
    -webkit-box-pack: center;
    justify-content: center;
    display: flex;
    border-top: 1px solid rgb(238, 238, 238);
    border-right: 1px solid rgb(238, 238, 238);
    border-bottom: 1px solid rgb(33, 33, 33);
    background: rgb(250, 250, 250);
    color: rgb(136, 136, 136);
        }
        .list-form{
            border: 1px solid black;
            width: 758px;
          
            /* padding-left: 200px; */
        }
        .list-a{
        display: flex;
    height: 50px;
    text-align:center;
    }
            
   
        
 </style>
</head>
<body>
		 <jsp:include page="../common/header.jsp"/>
	 	 <jsp:include page="../common/sideBar.jsp"/>
	 	 
	 
	 	 
	<div class="main-section">
        
    
       

    <div class="content2">

        <div class="profile">
            
            <div class="profile-image">


            </div>
            <br>
            <a href="#" class="market-grade">상점등급 안내</a>

        </div>

        <div class="info">
            <div class="info-table">
                <div class="market-name">상점<h3>${loginUser.userNo }</h3>호점</div><br><br>
                <div class="info-list">
                    <div class="market-open">
                        <img src="/tresure/resources/images/icon/상점오픈.png" width="14" height="13" alt="상점오픈일 아이콘">
                        상점오픈일<div class="market-opendate">일<span>${marketOpen }</span> 전</div>
                    </div>

                    <div class="follower">
                        <img src="/tresure/resources/images/icon/팔로워.png" width="14" height="13" alt="팔로워 아이콘">
                        팔로워<div class="market-follower"><span>${folloewCount }</span> 명</div>
                    </div>

                    <div class="sell-product">
                        <img src="/tresure/resources/images/icon/판매수.png" width="14" height="13" alt="상품판매 아이콘">
                        상품판매<div class="market-sell"> <span>${sellCount }</span> 회</div>
                    </div>

                    <div class="report">
                        <img src="/tresure/resources/images/icon/신고수.png" width="14" height="13" alt="신고 아이콘">
                        신고<div class="market-report"> <span>${reportCount }</span>회</div>
                    </div>
                    <br>
                    <br>

                    

                </div>
                <br>
                <br>
                <br>

                <div class="button-area1">
                    <a href="#" class= "following-list">팔로잉 목록</a>        
                </div>
                
                <div class="button-area2">
                    <a class="Withdrawal" href="#" data-toggle="modal">탈퇴하기</a>

                </div>
                

                    
            </div>

        </div>
       
        
    </div> 
    <div class="list-form">
    	<div class="list-content">
    		<div class="list-a">
    			<a class="market-product" href="#" id="product" onchange="search()";>상품<span class="rproduct"></span></a>
				<a class="market-review" href="#" id="review"onchange="search()";>상점후기<span class="rrview"></span></a>
				<a class="market-heart" href="#" id="heart"onchange="search()";>찜<span class="rheart"></span></a>
				<a class="market-tracsac" href="#">거래내역<span class="rtransac"></span></a>
    		</div>
    	
    	</div>
        
  

   
    </div> 
     

   
    

</div>

    


    
     <jsp:include page="../common/footer.jsp"/>
	 	 	
		
</body>
</html>