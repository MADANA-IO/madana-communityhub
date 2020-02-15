<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<meta http-equiv="refresh" content="5; URL='https://communityhub.madana.io/home'" />
<jsp:include page="components/header.jsp" />
<jsp:include page="components/loginheader.jsp" />
<style>
.login {
	position: absolute;
	top: calc(20%);
	left: calc(50% - 250px);
	height: 150px;
	width: 600px;
	z-index: 2;
}
</style>





<body >

	<div
		class="demo-layout mdl-layout mdl-js-layout mdl-layout--fixed-drawer mdl-layout--fixed-header" style="background:#565F66;">
		<div id="container">
			<img src="https://cdn.madana.io/commonvisuals/backgrounds/hero-grid@3x.png" />

			<br>
			<div class="content">
			
				<div class="login">
					
	<span style="margin-left:-200px;display:block;line-height:8px; font-size: 8px; font-weight:bold;white-space:pre;font-family: monospace;color: #a0c3e8 ">                                                                                                                          ..   /(#*@.                                                                
                                                                                    .#@@@@@@@@@@@@@@@@#,                 %*(, %,#.,%@%                                                               
                                                                                  .&@@@@@@@@@@@@@@@@@@@@@@@@*        #&&*@         .% &                                                              
                                                             ,/*%@   .&& %&    .@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@/    .. & ./%#         (&                                                             
                                                           .@   # &@&&,.*@*&/@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@,  ,%       .%.       (&                                                           
                                                          @..&/#.@         @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@/  /@.       .@.     @,                                                         
                                                        ,@    *&         @@  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@,   @,       (@    &*                                                        
                                                       (*   @*        *#      @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@    @        **   %.                                                       
                                                      #. //        /(       *@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@&    *,       *    @                                                       
                                                     &. @       ((        *@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#    *#       @   *@                                                      
                                                    (  #     (/        /@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@.    ,*       %   #*                                                     
                                                   .&  /   .(        .@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@&&&    ,%&,*,       @.  @                                                     
                                                   @  &   (.        (@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@           ,&        @  @                                                    
                                                  #. &   (         @@@@@@@@@@(@@&.#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@&*                  /.@                                                   
                                                 @. &   @         %@@@@@# .%..(@,   &@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%                .#                                                  
                                               .& ,(   @         /@@#        ,@@#    .@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ .#               .%                                                 
                                              & //   (%        #%        *@@@  @@          *@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@,  %                &                                                
                                             %      ,       ,@,        #@@@@,   @              ,@@@@@@@@@@@@@@@% ,&@@@@@@@@@@@@@&   &                &                                               
                                            &              @         #@@@@@       .&@@/          .@@@ @@@@@ *@&        @@@@@@@@@@   /@                #                                              
                                           &                       &@@@@@         @@@@@@@@@%/.   /   .  .  #./%@@@@@@.  @@@@@@@@@  .. @                #                                             
                                          &                       @@@@@/          ,#@@@@@@@@@@.  &   *   %@@@@@@@@@@@   ,@@@@@@@@   @ /.                %                                            
                                         (                      @@@@@@#         (      /   .@@%     ((##        *@. ,. #@@@@@@&    .@@                 &.                                          
                                        (                     *@@@@@@@        (*   .&  /%@&&&*  &.  ,. @   %#,((, %.   # ,@@@@@@#      /(                 .&                                         
                                       *                     &@@@@@@@@       *(     &%@@@@/(@%    *   %.  %@ %@@@@@@(  .  @@@@@@*       &                   ,%                                       
                                      (                     @@@@@@@@@@            .%        .(.  #      &  %&*    ,       @@@@@@         *                    .%                                     
                                     *                     @@@@@@@@@@/                                   *               *@@@@@@         #.                     .#                                   
                                    @                     &@@@@@@@@@@.                       /(                          .@@@@@           (&                      /*                                 
                                  @                      ,%@@@@@@@@@@                    (@/   @         ,, @            .@@@@               ,&,                    #,                               
                               ,&                        @ .@@@@@@%@@*                         &          (.             ,@@@                   *&                    @                              
                             #/                        ,(   @@@ .   &%                        (,,         &@*,           *@@&                     @,                   **                            
                           *%                         &     .@@,(,  &                       #@               @#          *% &                      #(                    &                           
                     &%..&@                         %        *@& #  @                      @.(.,@ #&   ,& #.&            .  &                       (&                    ,&         @               
                    (%. ,(                      .&,           &@                                                         .  %                        .#                     #%       @               
                    (   **                    &                @&                            &                %,         ..@                          .%                      #% ,&* /               
                   @     %                  .%                 .@@                         .@                  @.        .                              (                ./%@&*       #              
                 #,      (                 .&                   %@@@@@@.                   @    %#  ,(*  #*              %                              (#@&%%%%&@&(*.                 %,            
              .@        &                 /&                    .@@@@@@*                       @  *#%%##&,.&            (,&                              %.                             .#           
             (.         &                ,(                      #@@@%..                       @,     .    &          .,   (#                             @                               @          
            &            (@*            %(                           #.*                         /&,    ,&           #,      /*                           #.                               &.        
           #                           @.                            & #*                                           #          &.        %#                %                                *#       
          /.                         /.                          ,& *,  *(                                         @%           ,@   (@,     #@,         *&&                                  /      
         .,                          @                      .,   .%     @                       #@(,,%@/       &  /             #&              .*##*    ./                                 ./     
        /.                           &      ...    @#.             %       ,&                                   @   ..           .&                         &                                  ,     
       %                             @@&@#       &@.               &          @.                               @     .           @                          (                                   &    
     ,,                              &              /&             &             & .&.                       (*     #           @              ,                                                ./   
    /                                #                             .%               (   /(.                (       ,@,@        %                @            #                                   &   
   %                                 ,                               @               %          ,(%&&%%%%.        &@   /(     ((                .@           #                                   .*  
  *                                  *                                 %             ..                         &, (      #   @                  /,           %                                   @  
  #                                  %                                  (.            *                     (@,   #          ,@@(,                @           #                                   ,, 
 ,,                                  %                                    &           @&%*,..       ./%@%*       ,(              @                 #           (                                   & 
 /.                                 &                                        %/       %                          &               %                 ,           %.                                  . 
 @                                  *                                             (@#,/                          *               (                  @           @                                   (
(.                                 @                                                    %                       ,                @                   @          ./                                  &
&                                 %.                                                   *,                       @               ,/                   *(          @/                                 /
</span>
<h1>PAGE NOT FOUND</h1>
					<h3>We are redirecting you...</h3>
				</div>
			</div>
		</div>


	</div>



	<jsp:include page="components/footer.jsp" />


</body>
<script type="text/javascript">
$("#container").mousemove(function(e) {
  parallaxIt(e, ".slide", -100);
  parallaxIt(e, "img", -30);
});

function parallaxIt(e, target, movement) {
  var $this = $("#container");
  var relX = e.pageX - $this.offset().left;
  var relY = e.pageY - $this.offset().top;

  TweenMax.to(target, 1, {
    x: (relX - $this.width() / 2) / $this.width() * movement,
    y: (relY - $this.height() / 2) / $this.height() * movement
  });
}
	</script>
</html>
