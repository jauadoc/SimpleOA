function showMsg(msg, status,second) {
	if(second==undefined || second==0 || second=="" || second<0.15){
		second =2;
	}
	var forTime = Math.round(second*33.333333);
	$(".g-notice").removeClass("hidden");
	$("#g-notice-content").html(msg);
	if (status == "success") {
		$(".lywrap").removeClass("g-notice-error");
		$(".lywrap").addClass("g-notice-success");
	}
	if (status == "error") {
		$(".lywrap").removeClass("g-notice-success");
		$(".lywrap").addClass("g-notice-error");
	}
	var i = 0;
	var step = function() {
		if (i > forTime) {
			offAnimation();
		}
		if (i < 12) {
			// 上移
			if (i % 4 == 1) {
				$(".g-notice").removeClass("g-notice-down");
				$(".g-notice").addClass("g-notice-up");
			}
			// 中间
			if (i % 2 == 0) {
				$(".g-notice").removeClass("g-notice-up");
				$(".g-notice").removeClass("g-notice-up");
			}
			// 下移
			if (i % 4 == 3) {
				$(".g-notice").removeClass("g-notice-up");
				$(".g-notice").addClass("g-notice-down");
			}
		} else {

		}
		i++;
	}
	var offAnimation = function() {
		clearInterval(intervalId);
		$(".g-notice").addClass("hidden");
	}
	// 设置定时器，触发的间隔为10毫秒
	var intervalId = setInterval(step, 30);
}