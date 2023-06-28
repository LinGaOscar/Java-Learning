
<p:attrs id="twm_r_031" />
<c:set var="normal" value="${attrs[0]}" />


	<link rel="stylesheet" type="text/css" href="resources/common/css/jquery.loadingModal.css">
	<link rel="stylesheet" type="text/css" href="resources/twm_r_031/css/D_plus.css">
	<link rel="stylesheet" type="text/css" href="resources/twm_r_031/css/reset.css">
	<script type="text/javascript" src="resources/common/js/vue-2.3.3.js"></script>
	<script type="text/javascript" src="resources/common/js/jquery.loadingModal.min.js"></script>

	<div id="<p:iId/>">
		<!-- TST header -->
		<div class="TST_header">
			<div class="logo_wrap">
				<a href="https://www.tstartel.com/CWS/"> 
				<img src="resources/twm_r_031/images/tstarLogo-white.png" alt="">
				</a>
			</div>
		</div>

		<div class="container">
			<div class="img_wrap">
				<img src="resources/twm_r_031/images/DISNEY+_STAND_ALONE_LOGO_4C_DarkBack.png" alt="">
			</div>
			<!-- 未申辦Disney+服務 -->
			<div v-if="isApplyNow">
				<div class="title">您尚未申辦Disney+服務</div>

				<div class="border">
					<div class="border1"></div>
					<div class="border2"></div>
				</div>
				<a :href="disneyInfo.ACTIVATED_DEEPLINK" class="start">立即申辦Disney+</a>
			</div>
			<!-- 啟用Disney+帳號 -->
			<div v-if="isActiveNow">
				<div class="title">
					啟用Disney+帳號 <br> 即可開始觀看Disney+
				</div>
				<div class="border">
					<div class="border1"></div>
					<div class="border2"></div>
				</div>
				<div class="contract_info">
					專案名稱: {{disneyInfo.Name}} <br> 
					申請日期：{{disneyInfo.EXPIRY_DATE.substring(0, 10)}} <br> 
					觀看到期日：{{disneyInfo.EXPIRY_DATE.substring(0, 10)}} <br> 
					Disney+ 訂閱編號： {{disneyInfo.SUBID}}<br> 
					*合約到期後將自動轉為月訂型方案
				</div>

				<div class="border">
					<div class="border1"></div>
					<div class="border2"></div>
				</div>

				<div class="apply">
					進入Disney+網站後，請註冊會員，<br>或輸入既有Disney+帳戶完成啟用
				</div>
				<a :href="disneyInfo.ACTIVATED_DEEPLINK" class="start">立即啟用Disney+帳戶</a>
			</div>
			<!-- 啟用成功！ -->
			<div v-if="isWatchNow">
				<div class="title">啟用成功！</div>
				<div class="border">
					<div class="border1"></div>
					<div class="border2"></div>
				</div>
				<div class="contract_info">
					專案名稱: {{disneyInfo.Name}} <br> 
					申請日期：{{disneyInfo.EXPIRY_DATE.substring(0, 10)}} <br> 
					觀看到期日：{{disneyInfo.EXPIRY_DATE.substring(0, 10)}} <br> 
					Disney+ 訂閱編號： {{disneyInfo.SUBID}}<br> 
					*合約到期後將自動轉為月訂型方案
				</div>
				<div class="border">
					<div class="border1"></div>
					<div class="border2"></div>
				</div>
				<a :href="disneyInfo.ACTIVATED_DEEPLINK" class="start">立即觀看Disney+</a>
			</div>
		</div>
	</div>

	<script language="javascript">
		const twmr031 = new Vue({
			el : '<p:iId prefix="#"/>',
			data() {
            	return{
            		disneySvcId: [],
            		disneyInApply: [],
            		disneyInPromote: [],
            		disneyInfo: ''
            	}
			},
			created(){
				this.getDisneySvcId();
				this.getVascp();
			},
			computed:{
				isWatchNow(){
					return this.disneyInApply.some(item => item.ACTIVATED_STATUS==='ACTIVATED');
				},
				isApplyNow(){
					return Object.keys(this.disneyInPromote).length > 0;
				},
				isActiveNow(){
					return !this.isWatchNow && !this.isApplyNow;
				}
			},
			methods:{
				getVascp(){
					$('body').loadingModal({'animation': 'fadingCircle'});
					$.post('<p:base/>/rest/disney/queryVascp')
            		.done(result => {
            			const applyList = result.applyList;
            			const promoteList = result.promoteList;
           				
           				this.disneyInApply = applyList.find(item => this.disneySvcId.includes(item.SVC_ID))
           				this.disneyInPromote = promoteList.find(item => this.disneySvcId.includes(item.SVC_ID))
           				
           				this.disneyInfo = {...this.disneyInApply, ...this.disneyInPromote};
           				
           				if(Object.keys(this.disneyInfo).length === 0){
           					alert('no disney');
           				}
            		}).fail(jqXHR => {
                        alert(jqXHR.responseText);
                    }).always(() => {
                    	$('body').loadingModal('hide');
                    });;
				},
				getDisneySvcId(){
					if(!!"${normal.t1}"){
                		this.disneySvcId = [${normal.t1}];
                		console.log(this.disneySvcId);
                	}
				}
			}
		});
	</script>
