<style type="text/css">
				.person{position: absolute;top: 5px;left: 3px;width: 100%;height: 100%;overflow: auto;}
				.information{width: 1000px;}
				.col div{display: inline-block;width: 40%;height: 30px;font-size: 16px;}
				.col .title{width: 14%;text-align: right;}
				.row{margin-top: 5px;}
				.col .submit{margin-right: 5%;width: 35px;}
				.col .reset{margin-left: 5%;width: 35px;}
				.col .uhead{width: 100px;height: 100px;border:solid 1px black;}
				.headinfo{height: 100px;}
			</style>
			<div class="person">
				<div class="information">
					<br>
					个人信息
					<div class="split"></div>
					<!-- 这里所有的title写上指定id用来辨识数据库对应id -->
					<div class="row">
						<div class="col headinfo">
							<div class="title">头像:</div>
							<div class="info">
								<div class="uhead">&nbsp</div>
								<div>
									<input type="file" name="nickname">
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col">
							<div class="title" id="name">姓名:</div>
							<div class="info">
								<input type="text" name="nickname">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col">
							<div class="title">移动电话:</div>
							<div class="info">
								<input type="text" name="nickname">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col">
							<div class="title">家庭住址:</div>
							<div class="info">
								<input type="text" name="nickname">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col">
							<div class="title" id="name">姓名:</div>
							<div class="info">
								<input type="text" name="nickname">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col">
							<div class="title">移动电话:</div>
							<div class="info">
								<input type="text" name="nickname">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col">
							<div class="title">家庭住址:</div>
							<div class="info">
								<input type="text" name="nickname">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col">
							<div class="title" id="name">姓名:</div>
							<div class="info">
								<input type="text" name="nickname">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col">
							<div class="title">移动电话:</div>
							<div class="info">
								<input type="text" name="nickname">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col">
							<div class="title">家庭住址:</div>
							<div class="info">
								<input type="text" name="nickname">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col">
							<div class="title" id="name">姓名:</div>
							<div class="info">
								<input type="text" name="nickname">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col">
							<div class="title">移动电话:</div>
							<div class="info">
								<input type="text" name="nickname">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col">
							<div class="title">家庭住址:</div>
							<div class="info">
								<input type="text" name="nickname">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col sub">
							<div class="title"></div>
							<div class="info">
								<div class="submit u-btn" onclick="sumbit()">提交</div>
								<div class="reset u-btn">重置</div>
							</div>
						</div>
					</div>
				</div>
			</div>