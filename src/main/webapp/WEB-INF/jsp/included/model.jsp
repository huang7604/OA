<%@page contentType="text/html;charset=utf8"%>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					流程查看/操作
				</h4>
			</div>
			<div class="modal-body">
				在这里添加一些文本
			</div>
			
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>

<div class="modal fade" id="calendarModal" tabindex="-1" role="dialog" aria-labelledby="calendarModalLabel" aria-hidden="true">
	<div class="modal-dialog" style="width:680px">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
			</div>
			<div class="modal-body">
				在这里添加一些文本
			</div>
			
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
<script type="text/javascript">
  $(function(){
	  $("button.messageLook").click(function(){
		  $('#myModal').on('show.bs.modal', function (e) {  
	          // 关键代码，如没将modal设置为 block，则$modala_dialog.height() 为零  
	          $(this).css('display', 'block');  
	          $(this).find('.modal-dialog').css({  
	              'margin-top': '200px'  
	          });
	          
	          var button=$(e.relatedTarget);
	          var id=button.data("id");
	          var path=button.data("path")
	          var processName=button.data("name")
	          $("#myModalLabel").html(processName)
	          var page="/OfficeAutomation/home/"+path+"/"+id;
			  $.ajax(
					  {
					  type: "POST",
					  contentType: "application/x-www-form-urlencoded",
					  url: page,
					  data: {"name":processName},
					  success: function(result) {
						 $("div.modal-body").html(result)
					  }
					  
					  }
					  );
	      }); 
		  
		 
          
	  });
	  
	 
	  
  });
</script>