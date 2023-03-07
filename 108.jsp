<%--原rwd_c_105改--%>
<%@ page session="false" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.tstartel.com/CWS/tag" prefix="p"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<p:attrs id="rwd_c_108" />
<c:set var="normal" value="${attrs[0]}" />
<p:login includeNonTS="true">
	<link rel="stylesheet" type="text/css" href="resources/common/css/jquery.loadingModal.css">
	<link rel="stylesheet" type="text/css" href="resources/rwd_c_108/css/common.css">
	<link rel="stylesheet" type="text/css" href="resources/rwd_c_108/css/ts-member_card_info.css">
	<link rel="stylesheet" type="text/css" href="resources/rwd_c_108/css/Order_status.css">
	<link rel="stylesheet" type="text/css" href="resources/rwd_c_108/css/ts-member_function_info.css">
	<link rel="stylesheet" type="text/css" href="resources/rwd_c_108/css/sweetalert2.min.css">
	<link rel="stylesheet" type="text/css" href="resources/rwd_c_108/css/anual-dashboard.css">
	<link rel="stylesheet" type="text/css" href="resources/rwd_c_108/css/anual_main.css">
	<script type="text/javascript" src="resources/common/js/vue-2.3.3.js"></script>
	<script type="text/javascript" src="resources/common/js/jquery.loadingModal.min.js"></script>
	<script type="text/javascript" src="resources/common/js/numeral.min.js"></script>
	<script type="text/javascript" src="resources/rwd_c_108/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript" src="resources/rwd_c_108/js/jquery-barcode.js"></script>
	<script type="text/javascript" src="resources/rwd_c_108/js/sweetalert2.all.min.js"></script>
	<script type="text/javascript" src="resources/rwd_c_108/js/vue-components.js?v=2"></script>
	<p:identity>
		<c:choose>
			<c:when test="${IS_POSTPAY}">
				<link rel="stylesheet" type="text/css" href="resources/rwd_c_108/css/dashboard_custom.css">
				<%--建立星級呈現flag--%>
				<c:choose>
					<c:when test="${vip_reward == '金星'}">
						<c:set var="vipFlag" value="gold" />
						<c:set var="vipRank" value="gold" />
					</c:when>
					<c:when test="${vip_reward == '鑽星'}">
						<c:set var="vipFlag" value="diamond" />
						<c:set var="vipRank" value="diamond" />
					</c:when>
					<c:when test="${vip_reward == '紫星'}">
						<c:set var="vipFlag" value="purple" />
						<c:set var="vipRank" value="purple" />
					</c:when>
					<c:otherwise>
						<c:set var="vipFlag" value="default" />
						<c:set var="vipRank" value="pink" />
					</c:otherwise>
				</c:choose>
				<div id="<p:iId/>" style="display: none;">
					<div class="ts-member_card_info ts-member-top ts-${vipFlag}">
						<input name="vipFlag" id="vipFlag" type="hidden" value="${vipFlag}">
						<div class="ts-container" style="background-image: url(resources/rwd_c_108/images/pic_${vipFlag}@3x.png)">
							<div class="ts-widget-group">
								<div class="ts-widget user-card user-card--${vipFlag}">
									<div class="name">
										Hi ${hidden_code_name} <a onclick="ga('send', 'event', 'Dashboard', 'page_click', 'Card_Gear');uba('MC_W020404');"
											href="<spring:eval expression="@environment.getProperty(\'MC_DOMAIN_URL\')"/>/MyTstar/member-info.action" class="btn btn-link"><i
											class="icon icon-settings"></i></a>
									</div>
									<div class="phone">${hidden_code_isdn}</div>
									<div class="bottom">
										<div
											onclick="javascript:location.href='CWS/vip_feedback.php?rank=${vipRank}#table';
                                                ga('send', 'event', 'Dashboard', 'page_click', 'Card_Star');
                                                uba('MC_W020405');"
											style="cursor: pointer;" class="level">
											<span class="symbol"><img src="resources/rwd_c_108/images/icon-vip-${vipFlag}.png" alt="${vip_reward}"></span> T-Club ${vip_reward}
										</div>
										<!--BARCODE CONSOLE-->
										<barcode-console :pid="`${pid}`" :role="`normal`"></barcode-console>
									</div>
									<div class="shadows"></div>
								</div>
								<%--用量資訊--%>
								<div class="ts-widget use-status">
									<div v-show="isMobile" class="ts-widget__action">
										<a data-toggle="modal" data-target="#usage-modal" class="btn btn-link"
											onclick="ga('send', 'event', 'Dashboard', 'page_click', 'Usage_more');uba('MC_W020401');"><i class="icon icon-controlPoint"></i></a>
									</div>
									<div :class="volumeGrid" class="item-group">
										<div class="item">
											<div v-if="unbillInfo.dataUsage" class="main-text">
												{{unbillInfo.dataUsage}}<span>{{unbillInfo.dataUsagegUnit}}</span>
											</div>
											<div v-else class="main-text">
												<span>系統忙碌</span>
											</div>
											<span v-if="unbillInfo.interfree === 'N'">剩餘<br>總上網用量
											</span> <span v-else>已使用<br>總上網用量
											</span>
											<div v-show="!hideProject && mcProfile.companyId !== '035' && show4Gto5GStatus == '2' " style="opacity: .5">5G 上網吃到飽體驗中</div>
											<div v-show="!hideProject && mcProfile.companyId !== '035' && show4Gto5GStatus != '2' " v-html="unbillInfo.interfreemb" style="opacity: .5"></div>

											<div class="tethering-div">
												<a v-if="checkExperience5G && !isMobile" onclick="uba('MC_W020407')" data-toggle="modal" data-target="#tethering-modal"
													class="btn btn-link">查熱點用量</a>
											</div>

											<a v-if="unbillInfo.interfree === 'N'" href="<p:base/>/CWS/transQuanPlug.php" class="btn-secondary btn--small"
												onclick="ga('send', 'event', 'Dashboard', 'page_click', 'Usage_5Gpurchase'); uba('MC_W020402');">加購</a>
										</div>
										<div v-if="!isMobile && unbillInfo.interfree === 'Y' && mcProfile.companyId === '035'" class="item">
											<div class="main-text">
												{{unbillInfo.dataUsage5G}}<span>{{unbillInfo.dataUsagegUnit5G}}</span>
											</div>
											已使用<br>5G上網用量
										</div>
										<div v-if="!isMobile" class="item">
											<div class="main-text">
												{{unbillInfo.onnetVoice}}<span>分</span>
											</div>
											已撥打<br />網內通話量
											<div v-if="!hideProject" style="opacity: .5">{{unbillInfo.onnetmin}}</div>
										</div>
										<div v-if="!isMobile" class="item">
											<div class="main-text">
												{{unbillInfo.offnetVoice}}<span>分</span>
											</div>
											已撥打<br />網外通話量
											<div v-if="!hideProject" style="opacity: .5">{{unbillInfo.offnetmin}}</div>
										</div>
										<div v-if="!isMobile" class="item">
											<div class="main-text">
												{{unbillInfo.pstn}}<span>分</span>
											</div>
											已撥打<br />市話
											<div v-if="!hideProject" style="opacity: .5">{{unbillInfo.pstnmin}}</div>
										</div>
										<div v-if="isMobile" class="item">
											<div class="main-text">
												{{unbillInfo.totalVoice}}<span>分</span>
											</div>
											已撥打<br />國內通話量
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<c:if test="${not empty normal.flag1 && normal.flag1 == 'Y'}">
						<div v-show="onTheWayOrders && onTheWayOrders.length > 0" class="order_status">
							<div class="ts-container">
								<div class="heading">訂單動態</div>
								<div class="ts-widget">
									<!--ORDER CONSOLE-->
									<order-console :list="onTheWayOrders" :type="`dynamic`" :role="`normal`"></order-console>
								</div>
							</div>
						</div>
					</c:if>
					<div class="ts-member_function_info">
						<div class="ts-container">
							<ul class="nav nav-pills ts-tabs" id="ts-tab" role="tablist">
								<li class="nav-item"><a class="nav-link active" id="ts-tab-1-tab" data-toggle="pill"
									onclick="ga('send', 'event', 'Dashboard', 'page_click', '我的門號頁籤'); uba('MC_W020409');" href="#ts-tab-1" role="tab" aria-controls="ts-tab-1"
									aria-selected="true">我的門號</a></li>
								<li class="nav-item"><a class="nav-link" id="ts-tab-2-tab" data-toggle="pill"
									onclick="ga('send', 'event', 'Dashboard', 'page_click', '我的優惠頁籤'); uba('MC_W020410');" href="#ts-tab-2" role="tab" aria-controls="ts-tab-2"
									aria-selected="false">我的優惠</a></li>
							</ul>
							<div class="ts-tab-content" id="ts-tabContent">
								<!-- 我的門號 -->
								<div class="ts-tab-pane fade show active" id="ts-tab-1" role="tabpanel" aria-labelledby="ts-tab-1-tab">
									<div class="ts-widget-group">
										<!--我的帳單-->
										<div class="ts-widget">
											<div class="ts-widget__header">
												<h3 class="heading">我的帳單</h3>
												<div class="ts-widget__header-action">
													<a href="<p:base/>/CWS/queryBill.php" onclick="ga('send', 'event', 'Dashboard', 'page_click', '我的帳單_看更多'); uba('MC_W020601');">看更多<i
														class="icon icon-chevron_right"></i></a>
												</div>
											</div>
											<div class="ts-widget__content">
												<div class="list">
													<div class="item">
														<div class="col col-left">累積應繳金額</div>
														<div class="col col-right">{{billInfo.totalDebt | currency}}</div>
													</div>
													<div class="item">
														<div class="col col-left">繳款截止日</div>
														<div class="col col-right">{{billInfo.payEndTime}}</div>
													</div>
												</div>
											</div>
											<div class="ts-widget__footer">
												<a v-if="billInfo.totalDebt && billInfo.totalDebt > 0 && !isMobile" href="<p:base/>/CWS/paymentList_1.php" class="btn btn-secondary"
													onclick="ga('send', 'event', 'Dashboard', 'page_click', '我的帳單_繳款'); uba('W0205');">立即繳款</a> <a
													v-else-if="billInfo.totalDebt && billInfo.totalDebt > 0 && isMobile" href="<p:base/>/mCWS/quickAttest.php" class="btn btn-secondary"
													onclick="ga('send', 'event', 'Dashboard', 'page_click', '我的帳單_繳款'); uba('W0205');">立即繳款</a>
												<p v-else>無需繳款</p>
											</div>
										</div>
										<!--我的合約-->
										<div class="ts-widget">
											<div class="ts-widget__header">
												<h3 class="heading">我的合約</h3>
												<div class="ts-widget__header-action">
													<%--<a data-target="#myContract-modal" data-toggle="modal" onclick="ga('send', 'event', 'Dashboard', 'page_click', '我的合約_看更多')">看更多<i class="icon icon-chevron_right"></i></a>--%>
													<a href="<spring:eval expression="@environment.getProperty('MC_SSO_MY_DATA')"/>"
														onclick="ga('send', 'event', 'Dashboard', 'page_click', '我的合約_看更多'); uba('MC_W020501');">看更多<i class="icon icon-chevron_right"></i></a>
												</div>
											</div>
											<div class="ts-widget__content">
												<div class="list">
													<div class="item">
														<div class="col col-left">專案名稱</div>
														<div class="col col-right">{{mcProfile.projectName}}</div>
													</div>
													<div class="item">
														<div class="col col-left">合約到期日</div>
														<div v-if="isHideExpiredDate" class="col col-right">
															檢視<a class="btn btn-link" onclick="ga('send', 'event', 'Dashboard', 'page_click', '我的合約_到期日'); uba('MC_W020503');"><i
																@click="showExpiredDate" class="icon icon-add"></i></a>
														</div>
														<div v-else class="col col-right">{{mcProfile.expiredDate}}</div>
													</div>
												</div>
											</div>
											<div v-if="unbillInfo.isBL !== 'Y' && unbillInfo.isRx !== 'Y'" class="ts-widget__footer">
												<a v-if="renewStatus === '1' || renewStatus === '2'" href="https://pse.is/vzcfy" class="btn btn-secondary"
													onclick="ga('send', 'event', 'Dashboard', 'page_click', '我的合約_續約'); uba('MC_W020504');">立即續約</a> <a v-else-if="renewStatus === '5'"
													href="https://pse.is/v7mxp" class="btn btn-secondary"
													onclick="ga('send', 'event', 'Dashboard', 'page_click', '我的合約_升級'); uba('MC_W020505');">立即升級</a>
												<p v-else>你尚不符合續約資格</p>
											</div>
										</div>

										<!--電信帳單代收-->
										<div class="ts-widget">
											<div class="ts-widget__header">
												<h3 class="heading">電信帳單代收</h3>
												<div class="ts-widget__header-action">
													<a href="<p:base/>/CWS/billCollection.php" onclick="ga('send', 'event', 'Dashboard', 'page_click', '電信帳單代收_看更多'); uba('W0208');">看更多<i
														class="icon icon-chevron_right"></i></a>
												</div>
											</div>
											<div class="ts-widget__content">
												<div class="list">
													<div class="item">
														<div class="col col-left">服務開關管理</div>
														<div class="col col-right">
															<a v-if="isMobile" href="<p:base/>/mCWS/billCollection_switch.php" class="btn btn-link"
																onclick="ga('send', 'event', 'Dashboard', 'page_click', '電信帳單代收_開關'); uba('W0208');"><i class="icon icon-chevron_right"></i></a> <a
																v-else href="<p:base/>/CWS/billCollection.php" class="btn btn-link"
																onclick="ga('send', 'event', 'Dashboard', 'page_click', '電信帳單代收_開關'); uba('W0208');"><i class="icon icon-chevron_right"></i></a>
														</div>
													</div>
													<div class="item">
														<div class="col col-left">額度調整管理</div>
														<div class="col col-right">
															<a v-if="isMobile" href="<p:base/>/mCWS/billCollection_quota.php" class="btn btn-link"
																onclick="ga('send', 'event', 'Dashboard', 'page_click', '電信帳單代收_額度調整'); uba('W0208');"><i class="icon icon-chevron_right"></i></a> <a
																v-else href="<p:base/>/CWS/billCollection.php" class="btn btn-link"
																onclick="ga('send', 'event', 'Dashboard', 'page_click', '電信帳單代收_額度調整'); uba('W0208');"><i class="icon icon-chevron_right"></i></a>
														</div>
													</div>
												</div>
											</div>
										</div>

										<!-- 月租年繳-->
										<div v-if="annualPayment.panel" class="ts-widget">
											<div class="ts-widget__header">
												<h3 class="heading">
													月租費年繳 <i class="fa fa-question-circle-o" data-toggle="modal" data-target="#anual-contract" style="cursor: pointer;"></i>
												</h3>
											</div>
											<div class="ts-widget__content">
												<div class="list">
													<div class="item">
														<div class="col col-left">申請日</div>
														<div class="col col-right">{{ annualPayment.last.applydate.substring(0, 11) }}</div>
													</div>
													<div class="item">
														<div class="col col-left">年繳起始日</div>
														<div class="col col-right">{{ annualPayment.last.startdate.substring(0, 10) }}</div>
													</div>
													<div class="item">
														<div class="col col-left">已回饋總額</div>
														<div data-toggle="modal" class="col col-right">{{ annualPayment.discount_1 | currency }}</div>
													</div>
													<div class="item">
														<div class="col col-left">已扣抵總額</div>
														<div data-toggle="modal" class="col col-right">{{ annualPayment.discount_2 | currency }}</div>
													</div>
													<div class="item">
														<div class="col col-left">年繳餘額</div>
														<div class="col col-right">{{ annualPayment.discount_3 | currency }}</div>
													</div>
												</div>
											</div>
										</div>

										<!--門號管理-->
										<div v-if="phoneFamily" class="ts-widget">
											<div class="ts-widget__header">
												<h3 class="heading">門號管理</h3>
												<div class="ts-widget__header-action">
													<a href="<p:base/>/CWS/prepaid-numbermanage.php" onclick="ga('send', 'event', 'Dashboard', 'page_click', '門號管理_看更多')">看更多<i
														class="icon icon-chevron_right"></i></a>
												</div>
											</div>
											<div class="ts-widget__content">
												<div class="list">
													<div class="item">
														<div class="col col-left">名下月租門號數量</div>
														<div class="col col-right">{{phoneFamily.postpayAmount ? phoneFamily.postpayAmount : 0}} 門</div>
													</div>
													<div class="item">
														<div class="col col-left">名下預付門號數量</div>
														<div class="col col-right">{{phoneFamily.prepayAmount ? phoneFamily.prepayAmount : 0}} 門</div>
													</div>
													<div class="item">
														<div class="col col-left">立即管理</div>
														<div class="col col-right">
															<a href="<p:base/>/CWS/phoneConsole.php" class="btn btn-link" onclick="ga('send', 'event', 'Dashboard', 'page_click', '門號管理_立即管理')"><i
																class="icon icon-chevron_right"></i></a>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!--加值隨你選-->
										<div v-if="vasDIYProducts" class="ts-widget">
											<div class="ts-widget__header">
												<h3 class="heading">加值隨你選</h3>
												<p>免加購，每月可更換不同影音娛樂服務</p>
												<div class="ts-widget__header-action">
													<a href="<p:base/>/CWS/vasdiyset.php">{{vasDIYProducts.bindTitle}}<i class="icon icon-chevron_right"></i></a>
												</div>
											</div>
											<div class="ts-widget__content">
												<div v-if="vasDIYProducts.bindText" class="list">
													<div class="item">
														<div class="col col-left">
															<p>{{vasDIYProducts.bindText}}</p>
														</div>
													</div>
												</div>
												<div v-else class="list">
													<div v-for="svc in vasDIYProducts.appliedSubSvc" class="item">
														<div class="col col-left">
															<div class="image">
																<img :src="svc.svciconurl" :alt="svc.svcdisplayname">
															</div>
														</div>
														<div class="col col-right">已生效</div>
													</div>
													<div v-for="svc in vasDIYProducts.reservedSubSvc" class="item">
														<div class="col col-left">
															<div class="image">
																<img :src="svc.svciconurl" :alt="svc.svcdisplayname">
															</div>
														</div>
														<div class="col col-right">{{svc.preapplydate}} 下期生效</div>
													</div>
												</div>
											</div>
										</div>
										<!--加值服務-->
										<div v-if="vasCpInfo && vasCpInfo.applyList && vasCpInfo.applyList.length > 0" class="ts-widget">
											<div class="ts-widget__header">
												<h3 class="heading">加值服務</h3>
												<p>首次申裝指定加值型服務享首30天免月租費優惠，盡情享受隨身娛樂</p>
												<div class="ts-widget__header-action">
													<a data-target="#vascp-modal" data-toggle="modal"
														onclick="ga('send', 'event', 'Dashboard', 'page_click', '加值服務_看更多'); uba('MC_W020701');">看更多<i class="icon icon-chevron_right"></i></a>
												</div>
											</div>
											<div class="ts-widget__content">
												<div v-if="vasCpInfo.applyList" class="image-group">
													<div v-for="svc in vasCpInfo.applyList" class="image">
														<img :src="svc.svciconurl" :alt="svc.name">
													</div>
												</div>
											</div>
										</div>
									</div>
									<c:if test="${not empty normal.flag2 && normal.flag2 == 'Y'}">
										<div v-show="top10Orders && top10Orders.length > 0" class="ts-widget order-overview">
											<div class="ts-widget__header">
												<h3 class="heading">訂單總覽</h3>
												<div class="ts-widget__header-action">
													<a href="<p:base/>/CWS/Dashboard_order.php" onclick="ga('send', 'event', 'Dashboard', 'page_click', '訂單總覽_看更多'); uba('MC_W021001');">看更多<i
														class="icon icon-chevron_right"></i></a>
												</div>
											</div>
											<div class="ts-widget__content">
												<!--ORDER CONSOLE-->
												<order-console :list="top10Orders" :type="`overview`" :role="`normal`"></order-console>
											</div>
										</div>
									</c:if>
								</div>

								<!-- 我的優惠 -->
								<div class="ts-tab-pane fade" id="ts-tab-2" role="tabpanel" aria-labelledby="ts-tab-2-tab">
									<div class="ts-widget-group">
										<!--家族省(CGC)-->
										<div class="ts-widget">
											<div class="ts-widget__header">
												<h3 class="heading">家族省</h3>
												<div class="ts-widget__header-action">
													<%--<a href="<p:base/>/CWS/family.php" onclick="ga('send', 'event', 'Dashboard', 'page_click', '家族省_看更多')">看更多<i class="icon icon-chevron_right"></i></a>--%>
												</div>
											</div>
											<div class="ts-widget__content">
												<div class="list">
													<div class="item">
														<div class="col col-left">目前群組人數</div>
														<div class="col col-right">{{cgc.groupCNT ? cgc.groupCNT : 0}}名</div>
													</div>
													<div class="item">
														<div class="col col-left">優惠歷程</div>
														<div class="col col-right">
															<a data-target="#cgc-modal" data-toggle="modal" class="btn btn-link"
																onclick="ga('send', 'event', 'Dashboard', 'page_click', '家族省_優惠歷程')"><i class="icon icon-chevron_right"></i></a>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!--好友省(MGM)-->
										<div class="ts-widget">
											<div class="ts-widget__header">
												<h3 class="heading">好友省</h3>
											</div>
											<div class="ts-widget__content">
												<div class="list">
													<div class="item">
														<div class="col col-left">有效通話金</div>
														<div class="col col-right">{{mgm.effectiveamt | currency}}</div>
													</div>
													<div class="item">
														<div class="col col-left">失效通話金(已使用/逾期)</div>
														<div class="col col-right">{{mgm.invalidamt | currency}}</div>
													</div>
													<div class="item">
														<div class="col col-left">推薦紀錄</div>
														<div class="col col-right">
															<a data-target="#mgm-modal" data-toggle="modal" class="btn btn-link"
																onclick="ga('send', 'event', 'Dashboard', 'page_click', '好友省_推薦紀錄')"><i class="icon icon-chevron_right"></i></a>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!--感謝禮-電信帳單代收抵用金-->
										<div v-if="churnDcbCoupon" class="ts-widget">
											<div class="ts-widget__header">
												<h3 class="heading">
													感謝禮<span class="m-hide">-</span><span class="m-block">電信帳單代收抵用金</span>
												</h3>
												<div class="ts-widget__header-action"></div>
											</div>
											<div class="ts-widget__content">
												<div class="list">
													<div class="item">
														<div class="col col-left">使用期限</div>
														<div class="col col-right">{{churnDcbCoupon.periodStartTime | formatDate}} - {{churnDcbCoupon.periodEndTime | formatDate}}</div>
													</div>
													<div class="item">
														<div class="col col-left">當期電信帳單代收抵用金</div>
														<div class="col col-right">{{churnDcbCoupon.periodQuota | currency}}</div>
													</div>
													<div class="item">
														<div class="col col-left">當期餘額</div>
														<div class="col col-right">{{churnDcbCoupon.availableQuota | currency}}</div>
													</div>
												</div>
											</div>
										</div>
										<!--電信帳單代收抵用金-->
										<div v-if="aqDcbCoupon" class="ts-widget">
											<div class="ts-widget__header">
												<h3 class="heading">電信帳單代收抵用金</h3>
												<div class="ts-widget__header-action"></div>
											</div>
											<div class="ts-widget__content">
												<div class="list">
													<div class="item">
														<div class="col col-left">合約內贈送</div>
														<div class="col col-right">{{aqDcbCoupon.periodQuota | currency}}</div>
													</div>
													<div class="item">
														<div class="col col-left">剩餘金額</div>
														<div class="col col-right">{{aqDcbCoupon.availableQuota | currency}}</div>
													</div>
												</div>
											</div>
										</div>
										<!-- 優惠卷 原PDR CONSOLE-->
										<div class="ts-widget" v-if="pdrStatus.status !== '6'">
											<div class="ts-widget__header">
												<h3 class="heading">優惠卷</h3>
											</div>
											<div class="ts-widget__content">
												<div class="list">
													<div class="item">
														<div class="col col-left">擁有優惠券</div>
														<div class="col col-right">{{pdrStatus.couponAmount}}張</div>
													</div>
													<div class="item">
														<div class="col col-left">查詢優惠券</div>
														<div class="col col-right">
															<a href="<p:base/>/CWS/Dashboard_coupon.php" class="btn btn-link"
																onclick="ga('send', 'event', 'Dashboard', 'page_click', 'PDR_優惠券');uba('MC_W05');"><i class="icon icon-chevron_right"></i></a>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!--Modal-->
					<!-- 5G熱點用量 -->
					<div class="modal fade" id="tethering-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
						<div class="modal-dialog modal-dialog-centered" role="document">
							<div class="modal-content">
								<div class="modal-body">
									<div class="usage-modal">
										<div class="block">
											<p>剩餘熱點總分享用量 {{ ws5GTethering.tetRemainQuota }}GB</p>
											<p>目前專案 : 可用 {{ ws5GTethering.tetTotalQuota }}GB</p>
										</div>
									</div>
								</div>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
						</div>
					</div>
					<!-- 會員中心_我的合約 -->
					<div class="modal fade" id="myContract-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
						<div class="modal-dialog modal-dialog-centered" role="document">
							<div class="modal-content">
								<div class="modal-body">
									<div class="myContract-modal">
										<div class="block">
											<div class="title">{{mcProfile.projectName}}</div>
										</div>
										<div class="block">
											<ol v-html="mcProfile.contractInfo"></ol>
											<p v-show="mcProfile.contractInfo" class="text-sm">※此專案優惠內容為終身優惠，惟終止契約、降轉資費或異動專案時，專案優惠內容即終止</p>
										</div>
										<div v-if="renewStatus === '1' || renewStatus === '2'" class="block bottom">
											<div class="hd">續約資格： 你已符合續約資格</div>
											<p v-show="discInfo">※如你尚未找到適合的續約方案，本合約到期後，你的原方案優惠仍然不變，免續約，一價到底。</p>
											<a href="https://pse.is/vzcfy" class="btn btn-secondary btn--small">立即續約</a>
										</div>
										<div v-else-if="renewStatus === '5'" class="block bottom">
											<div class="hd">續約資格： 你已符合原約升級資格</div>
											<a href="https://pse.is/v7mxp" class="btn btn-secondary btn--small">立即升級</a>
										</div>
										<div v-else class="block bottom">
											<div class="hd">你尚未符合續約資格</div>
										</div>
									</div>
								</div>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
						</div>
					</div>
					<!-- 會員中心_4g to 5g  -->
					<div ref="sp4Gto5G-modal" id="sp4Gto5G-modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
						<div class="modal-dialog modal-dialog-centered" role="document">
							<div class="modal-content">
								<div class="modal-body">
									<div class="title">申請確認</div>
									<p class="text-center">
										<br />送出後預計於2小時內生效。
									</p>
									<div class="action">
										<a @click="closeDia('sp4Gto5G-modal')" class="btn btn-secondary" data-dismiss="modal">取消返回</a> <a @click="sendSp4Gto5G"
											class="btn btn-secondary">確認送出</a>
									</div>
									<p class="text-center">
										<br />請先確認你的手機是否支援台灣之星5G頻段，與你的生活圈周遭是否有5G訊號，否則將無法體驗5G網路。
									</p>
								</div>
								<button type="button" class="close" @click="closeDia('sp4Gto5G-modal')" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
						</div>
					</div>
					<!-- 會員中心_4g to 5g  success-->
					<div ref="sp4Gto5GSuccess-modal" id="sp4Gto5GSuccess-modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
						<div class="modal-dialog modal-dialog-centered" role="document">
							<div class="modal-content">
								<div class="modal-body">
									<p class="text-center">
										<br />你已成功送出申請，系統將於2小時內生效。後續相關通知訊息將以台灣之星APP發送，提醒你記得下載台灣之星APP就不會錯過任何通知。
									</p>
									<div class="action">
										<a class="btn btn-secondary" @click="closeDia('sp4Gto5GSuccess-modal')" data-dismiss="modal">我知道了</a>
									</div>
								</div>
								<button type="button" class="close" @click="closeDia('sp4Gto5GSuccess-modal')" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
						</div>
					</div>
					<!-- 會員中心_4g to 5g  status 2-->
					<div ref="sp4Gto5GStatus2-modal" id="sp4Gto5GStatus2-modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
						<div class="modal-dialog modal-dialog-centered" role="document">
							<div class="modal-content">
								<div class="modal-body">
									<div class="title">老客戶免費5G體驗中</div>
									<p class="text-center">
										<br />你已於{{sp4Gto5G.regstartdate}}完成申請，目前正在體驗中，體驗資格將於{{sp4Gto5G.regenddate}}到期。
									</p>
									<div class="action">
										<a @click="closeDia('sp4Gto5GStatus2-modal')" class="btn btn-secondary" data-dismiss="modal">我知道了</a> <a @click="sendCanelSp4Gto5GCheck"
											class="btn btn-secondary">取消體驗</a>
									</div>
								</div>
								<button type="button" class="close" @click="closeDia('sp4Gto5GStatus2-modal')" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
						</div>
					</div>
					<!-- 會員中心_4g to 5g  cancel-->
					<div ref="cancelSp4Gto5G-modal" id="cancelSp4Gto5G-modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
						<div class="modal-dialog modal-dialog-centered" role="document">
							<div class="modal-content">
								<div class="modal-body">
									<div class="title">申請取消體驗</div>
									<p class="text-center">
										<br />請注意，取消後體驗時間將提前結束，剩餘的體驗時間將無法再繼續使用，且須待取消一年後方可再次重新申請本服務。 <br />送出後預計於2小時內切換回你原專案的網速。
									</p>
									<div class="action">
										<a @click="closeDia('cancelSp4Gto5G-modal')" class="btn btn-secondary" data-dismiss="modal">返回</a> <a @click="sendCanelSp4Gto5G"
											class="btn btn-secondary">確認取消體驗</a>
									</div>
								</div>
								<button type="button" class="close" @click="closeDia('cancelSp4Gto5G-modal')" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
						</div>
					</div>
					<!-- 會員中心_4g to 5g  cancel success-->
					<div ref="showExperInformation-modal" id="showExperInformation-modal" class="modal fade" tabindex="-1" role="dialog"
						aria-labelledby="myModalLabel">
						<div class="modal-dialog modal-dialog-centered" role="document">
							<div class="modal-content">
								<div class="modal-body">
									<div class="title">注意事項</div>
									<p>
										<br />1. 每個有效月租型門號一年內限體驗1次。 <br />2. 5G網速體驗期間為系統生效日起算共計30天，第31天起恢復原專案網速。 <br />3.
										申辦前請確保你使用的手機支援台灣之星的5G頻段，若上網地點無法支援5G行動寬頻網路，將自動轉為4G網路或異質網路。 <br />4. 5G網速體驗期間內如欲辦理5G續約、5G升級、退租、解約、過戶、專案異動等服務，需先取消5G網速體驗服務，取消後一年內將無法再次申請本服務。 <br />5.
										5G網速體驗期間內如自行提前取消5G網速體驗服務，視同體驗期限屆滿(即你自願放棄該門號剩餘試用天數) <br />6.
										如你為月租型非吃到飽方案用戶，則體驗期間使用之5G上網量為上網吃到飽，不會扣除你的原專案本身贈送之4G上網量。但如你為「用多少付多少」或「保證最低價」方案用戶，則你於5G網速體驗期間使用之5G上網量仍依原專案本身之相關計費規則進行收費。 <br />7.
										台灣之星保留活動修改或終止之權利，活動詳細內容及範圍以台灣之星公告為準。
									</p>
								</div>
								<button type="button" class="close" @click="closeDia('showExperInformation-modal')" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
						</div>
					</div>
					<!-- 會員中心_我的用量 -->
					<div class="modal fade" id="usage-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
						<div class="modal-dialog modal-dialog-centered" role="document">
							<div class="modal-content">
								<div class="modal-body">
									<div class="usage-modal">
										<div class="block">
											<span v-if="unbillInfo.dataUsage">{{unbillInfo.interfree === 'N' ? '剩餘' : '已使用'}}總上網用量
												{{unbillInfo.dataUsage}}{{unbillInfo.dataUsagegUnit}}</span> <span v-else>系統忙碌</span>
											<div v-show="!hideProject && mcProfile.companyId !== '035' && show4Gto5GStatus == '2' " class="sub-text" style="opacity: .5">5G
												上網吃到飽體驗中</div>
											<div v-show="!hideProject && mcProfile.companyId !== '035' && show4Gto5GStatus != '2' " v-html="unbillInfo.interfreemb" class="sub-text"
												style="opacity: .5"></div>

											<div v-if="unbillInfo.interfree === 'N'" class="action">
												<a href="<p:base/>/CWS/transQuanPlug.php" class="btn btn-secondary btn--small"
													onclick="ga('send', 'event', 'Dashboard', 'page_click', 'Usage_5Gpurchase'); uba('MC_W020402');">加購</a>
											</div>
										</div>
										<div v-if="unbillInfo.interfree === 'Y' && mcProfile.companyId === '035'" class="block">
											已使用5G上網用量 {{unbillInfo.dataUsage5G}}<span>{{unbillInfo.dataUsagegUnit5G}}</span>
											<div class="sub-text"></div>
										</div>
										<div v-if="checkExperience5G" class="block tethering-div">
											<p>剩餘熱點總分享用量 {{ws5GTethering.tetRemainQuota}}GB</p>
											<p>目前專案 : 可用 {{ ws5GTethering.tetTotalQuota }}GB</p>
										</div>
										<div class="block">
											已撥打網內 {{unbillInfo.onnetVoice}}分鐘
											<div v-if="!hideProject" class="sub-text">{{unbillInfo.onnetmin}}</div>
										</div>
										<div class="block">
											已撥打網外 {{unbillInfo.offnetVoice}}分鐘
											<div v-if="!hideProject" class="sub-text">{{unbillInfo.offnetmin}}</div>
										</div>
										<div class="block">
											已撥打市話 {{unbillInfo.pstn}}分鐘
											<div v-if="!hideProject" class="sub-text">{{unbillInfo.pstnmin}}</div>
										</div>
										<div class="block">
											注意事項 <a><i class="icon icon-error_outline"></i></a>
											<p:htmlOut text="${normal.h1}" />
										</div>
									</div>
								</div>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
						</div>
					</div>
					<!-- 年繳方案_pop_注意事項 -->
					<div class="modal fade" id="anual-contract" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
						<div class="modal-dialog modal-dialog-centered" role="document">
							<div class="modal-content">
								<div class="modal-body">
									<div class="title">月租費年繳說明</div>
									<p:htmlOut text="${normal.h2}" />
								</div>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
						</div>
					</div>
					<!-- 加值服務申請 -->
					<div class="modal fade" id="vascp-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
						<div class="modal-dialog modal-dialog-centered" role="document">
							<div class="modal-content">
								<div class="modal-body">
									<div class="usage-modal">
										<h3>加值服務</h3>
										<div v-if="vasCpInfo" class="block">
											<table class="table">
												<tbody>
													<tr v-for="svc in vasCpInfo.applyList">
														<td><img :src="svc.svciconurl" :alt="svc.name" width="40"></td>
														<td>{{svc.shortName}}</td>
														<td v-if="svc.applyDate">申請日期 {{svc.applyDate.substring(0, 10)}}</td>
														<td v-else>{{svc.message}}</td>
													</tr>
													<tr v-for="svc in vasCpInfo.promoteList">
														<td><img :src="svc.svciconurl" :alt="svc.name" width="40"></td>
														<td>{{svc.shortName}}</td>
														<td><a v-if="isMobile" :href="svc.landingPageM" class="btn btn-secondary">立即試用</a> <a v-else :href="svc.landingpage"
															class="btn btn-secondary">立即試用</a></td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
						</div>
					</div>
					<!-- 家族省：優惠歷程 -->
					<div class="modal fade" id="cgc-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
						<div class="modal-dialog modal-dialog-centered" role="document">
							<div class="modal-content">
								<div class="modal-body">
									<div class="usage-modal">
										<div class="block">
											優惠狀態：<br> 目前群組內共有 <span style="font-size: larger; color: #ec008c;">{{cgc.groupCNT ? cgc.groupCNT : 0}}</span> 人<br> (最高可達30人)
										</div>
										<div v-show="!!cgcHistory" class="block">
											優惠歷程：<br> {{cgcHistory}}
										</div>
									</div>
								</div>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
						</div>
					</div>
					<!-- 好友省：推薦歷程 -->
					<div class="modal fade" id="mgm-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
						<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
							<div class="modal-content">
								<div class="modal-body">
									<div class="usage-modal">
										<div v-if="mgm.accumulateamt && parseInt(mgm.accumulateamt) > 0" class="block">
											本月成功推薦 <span style="font-size: larger; color: #ec008c;">{{mgm.people ? mgm.people : 0}}</span> 人， 獲得通話金 <span
												style="font-size: larger; color: #ec008c;">{{mgm.amt ? mgm.amt : 0}}</span> 元
										</div>
										<div v-else>推薦1位好友分別送$300通話金，通話金累積無上限。</div>
										<div class="block">
											<div class="d-flex justify-content-between flex-wrap">
												<div style="color: #9b9b9b">近六個月成功推薦紀錄</div>
												<div style="color: #9b9b9b">*代表你被推薦時的通話金紀錄</div>
											</div>
											<br>
											<table v-if="mgmRecords.length > 0" class="table table-bordered">
												<thead>
													<tr>
														<th scope="col">推薦日期</th>
														<th scope="col">被推薦人門號</th>
														<th scope="col">合約生效日</th>
														<th scope="col">通話金</th>
														<th scope="col">通話金生效日</th>
													</tr>
												</thead>
												<tbody>
													<tr v-for="record in mgmRecords">
														<td>{{record.date}}</td>
														<td>{{record.msisdn}}</td>
														<td>{{record.agreedate}}</td>
														<td>{{record.effectiveamt}}</td>
														<td>{{record.effectivedate}}</td>
													</tr>
												</tbody>
											</table>
											<strong v-if="mgmRecords.length === 0">近六個月無成功推薦紀錄</strong>
										</div>
									</div>
								</div>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
						</div>
					</div>
				</div>
				<script language="javascript">
                    const rwdc099 = new Vue({
                        el: '<p:iId prefix="#"/>',
                        data: {
                            // 數位會員擴散
                            spreadVascp: 'N',
                            // 續約狀態
                            renewStatus: null,
                            // 我的專案
                            mcProfile: {},
                            // 方案說明
                            discInfo: false,
                            // 檢視專案到期日開關
                            isHideExpiredDate: true,
                            // 未出帳流量
                            unbillInfo: {},
                            // 在途訂單
                            onTheWayOrders: [],
                            // 前10訂單
                            top10Orders: [],
                            // 購物金狀態
                            pdrStatus: {},
                            // 帳單資訊
                            billInfo: {},
                            // 門號管理
                            phoneFamily: null,
                            // 加值服務
                            vasCpInfo: null,
                            // 加值隨你選
                            vasDIYProducts: null,
                            // 家族省
                            cgc: {},
                            // 好友省
                            mgm: {},
                            // 好友省推薦歷程
                            mgmRecords: [],
                            // 電信帳單代收抵用金
                            aqDcbCoupon: null,
                            // 感謝禮-電信帳單代收抵用金
                            churnDcbCoupon: null,
                            // 開啟5G熱點體驗視窗
                            checkExperience5G: false,
                            // 5G熱點傳輸量
                            ws5GTethering: {},
                            window: {width: 0, inMobile: false},
                            // 4G老客戶體驗5G網速
                            sp4Gto5G: {},
                            // 4G老客戶可否體驗5G網速
                            show4Gto5G: false,
                            // 4G老客戶體驗5G網速狀態- 0:不可申請，1:可申請，2:體驗中
                            show4Gto5GStatus: '0',
                            // 體驗網速判斷是否有在途件
                            sp4Gto5GHasNoRt: false,
                            // 月租年繳資訊
                            annualPayment: {
                                panel: false,       // 年繳面板顯示
                                promo: false,       // 年繳推廣顯示
                                button: null        // 面板按鈕文案
                            }
                        },
                        created() {
                            // 設定loading樣式
                            $('body').loadingModal({'animation': 'fadingCircle'});

                            $.post('<p:base/>/rest/dashboard/postpay')
                             .done(resp => {
                                 this.spreadVascp = resp.spreadVascp;
                                 if (this.spreadVascp === 'Y') location.href = '${normal.t4}';

                                 this.mcProfile = resp.mcProfile;
                                 this.renewStatus = resp.renewStatus;
                                 this.discInfo = resp.discInfo;
                                 this.unbillInfo = this.parseUnbillInfo(resp.unbillInfo);
                                 this.onTheWayOrders = resp.onTheWayOrders ? resp.onTheWayOrders : [];
                                 this.top10Orders = resp.top10Orders ? resp.top10Orders : [];
                                 this.pdrStatus = resp.pdrStatus ? resp.pdrStatus : {};
                                 this.billInfo = resp.billInfo;
                                 this.phoneFamily = resp.phoneFamily;
                                 this.vasCpInfo = resp.vasCpInfo;
                                 this.vasDIYProducts = this.parseVasDiy(resp.vasDIYProducts);
                                 this.cgc = resp.cgc ? resp.cgc : {};
                                 this.mgm = resp.mgm ? resp.mgm : {};
                                 this.mgmRecords = resp.mgmRecords ? resp.mgmRecords : [];
                                 this.aqDcbCoupon = resp.aqDcbCoupon;
                                 this.churnDcbCoupon = resp.churnDcbCoupon;
                                 this.checkExperience5G = resp.experience5G;
                                 this.ws5GTethering = this.parse5GTethering(resp.experience5G ? resp.ws5GTethering : {});
                                 this.sp4Gto5G = resp.sp4Gto5G;
                                 this.sp4Gto5GHasNoRt = resp.sp4Gto5G_hasNoRt;
                                 this.show4Gto5GMethod();
                                 this.annualPayment = this.annualPanel(resp.isAnnual, resp.annualList);
                             })
                             .always(() => {
                                 $('body').loadingModal('hide');
                                 $('<p:iId prefix="#"/>').show();
                                 // 依傳入參數進行Tab切換
                                 const tabFlag = '<c:out value="${param.tab}" escapeXml="true"/>';
                                 if (tabFlag === 'bonus') {
                                     $('#ts-tab-2-tab').tab('show');
                                     setTimeout(() => {
                                         $('html, body').animate({scrollTop: $('#ts-tab-2').offset().top - 200}, 'fast')
                                     }, 1000);
                                 }
                             });
                        },
                        methods: {
                            // 顯示到期日
                            showExpiredDate() {
                                this.isHideExpiredDate = !this.isHideExpiredDate;
                            },
                            // 未出帳用量解析
                            parseUnbillInfo(info) {
                                if (!info) return {interfree: 'N'};

                                // 計算總通話量
                                let onnet = parseInt(info.onnetVoice);
                                let offnetVoice = parseInt(info.offnetVoice);
                                let pstn = parseInt(info.pstn);
                                info.totalVoice = onnet + offnetVoice + pstn;
                                return info;
                            },
                            // 加值隨你選解析
                            parseVasDiy(product) {
                                if (!product) return null;

                                // 找出門號加值包(type = 1 or 2)
                                if (product.vascpPKGDATA && product.vascpPKGDATA.wsVASCPquerypkgsvcbyuserResponseRESULTDATA) {
                                    const vasPkgData = product.vascpPKGDATA.wsVASCPquerypkgsvcbyuserResponseRESULTDATA.filter(pkg => pkg.pkgtype === '1' || pkg.pkgtype === '2').pop();
                                    if (vasPkgData.isprocessing === '1') {
                                        return {bindTitle: '我要更換', bindText: '服務設定中'};
                                    } else {
                                        // 是否有已申裝服務或已預約服務
                                        if (vasPkgData && vasPkgData.subsvclist.wsVASCPquerypkgsvcbyuserResponseSUBSVCLIST) {
                                            const subList = vasPkgData.subsvclist.wsVASCPquerypkgsvcbyuserResponseSUBSVCLIST;
                                            return {
                                                bindTitle: '我要更換',
                                                // 已申裝: PKG_ORDER_ID相等 && status = 1
                                                appliedSubSvc: subList.filter(sub => sub.pkgorderid === vasPkgData.pkgorderid && sub.status === '1'),
                                                // 已預約: PKG_ORDER_ID相等 && status = 0 && modifiable = 2
                                                reservedSubSvc: subList.filter(sub => sub.pkgorderid === vasPkgData.pkgorderid && sub.status === '0' && sub.modifiable === '2'),
                                            };
                                        }
                                    }
                                }
                                return {bindTitle: '立即綁定', bindText: '尚未進行首次綁定'};
                            },
                            // 家族省分享
                            doCgcShare() {
                                if (this.isMobile) {
                                    window.open(`${normal.t2}`);
                                } else {
                                    window.open('http://www.facebook.com/share.php?u=https://www.tstartel.com/CWS/family.php');
                                }
                            },
                            // 好友省分享
                            doMgmShare() {
                                if (this.isMobile) {
                                    window.open(`${normal.t3}`);
                                } else {
                                    window.open(`http://www.facebook.com/share.php?u=https://www.tstartel.com/CWS/mgm.php?mgmCode=${'${this.mgm.mgmcode}'}`);
                                }
                            },
                            // 5G熱點用量轉換
                            parse5GTethering(info) {
                                // 熱點傳輸量單位轉換
                                return {
                                    tetRemainQuota: info && info.tetRemainQuota ? (info.tetRemainQuota / 1073741824).toFixed(2) : 0,
                                    tetTotalQuota: info && info.tetTotalQuota ? (info.tetTotalQuota / 1073741824).toFixed(2) : 0
                                }
                            },
                            handleResize() {
                                this.window.width = window.innerWidth;
                                this.window.height = window.innerHeight;
                            },
                            // 判斷可否4G體驗5G網速
                            show4Gto5GMethod() {
                                // 尚有在途件時不可體驗
                                if (this.sp4Gto5GHasNoRt) {
                                    if (this.sp4Gto5G.resultcode == '00') {
                                        this.show4Gto5G = true;
                                        this.show4Gto5GStatus = '1';
                                    } else if (this.sp4Gto5G.resultcode == '03' && this.sp4Gto5G.regStatus == '01') {
                                        this.show4Gto5G = true;
                                        this.show4Gto5GStatus = '2';
                                    }
                                }
                            },
                            // 體驗5G網速申請視窗
                            showCheck4Gto5G() {
                                document.getElementById('sp4Gto5G-modal').className = "modal show";
                                ga('send', 'event', 'Dashboard_index', 'button_click', '5G網速體驗_立即申請');
                                uba('W1002');
                            },
                            // 4G體驗5G網速申請
                            sendSp4Gto5G() {
                                ga('send', 'event', 'Dashboard_index', 'button_click', '5G網速體驗_立即申請_確認送出');
                                uba('W1003');
                                let experienceDay = '30';
                                document.getElementById('sp4Gto5G-modal').className = "modal fade";
                                const vipFlag = document.getElementById('vipFlag').value;

                                switch (vipFlag) {
                                    case 'gold':
                                        experienceDay = '60';
                                        break;

                                    case 'diamond':
                                        experienceDay = '60';
                                        break;
                                    case 'purple':
                                        experienceDay = '60';
                                        break;
                                    case 'default':
                                        experienceDay = '30';
                                        break;
                                    default:
                                        experienceDay = '30';
                                        break;
                                }

                                $.post('<p:base/>/rest/dashboard/activeSp4Gto5G', {experience: experienceDay})
                                 .done(resp => {
                                     document.getElementById('sp4Gto5GSuccess-modal').className = "modal show";
                                 });
                            },
                            closeDia(value) {
                                document.getElementById(value).className = "modal fade";
                                if (value == 'sp4Gto5GSuccess-modal' || value == 'cancelSp4Gto5GSuccess-modal') {
                                    window.location.reload();
                                }
                            },
                            showSp4Gto5GStatus2() {
                                document.getElementById('sp4Gto5GStatus2-modal').className = "modal show";
                                ga('send', 'event', 'Dashboard_index', 'button_click', '5G網速體驗_體驗中');
                                uba('W1004');
                            },
                            sendCanelSp4Gto5GCheck() {
                                document.getElementById('sp4Gto5GStatus2-modal').className = "modal fade";
                                document.getElementById('cancelSp4Gto5G-modal').className = "modal show";
                            },
                            sendCanelSp4Gto5G() {
                                ga('send', 'event', 'Dashboard_index', 'button_click', '5G網速體驗_體驗中_確認取消體驗');
                                uba('W1005');
                                $.post('<p:base/>/rest/dashboard/cancelSp4Gto5G')
                                 .done(resp => {
                                     //console.log(resp.sp4Gto5GCancel);
                                     document.getElementById('cancelSp4Gto5G-modal').className = "modal fade";
                                     Swal.fire({
                                         icon: 'success',
                                         title: '老客戶免費5G體驗取消完成',
                                         text: '你已成功送出取消申請，系統將於2小時內生效，謝謝。'
                                     });
                                 });
                            },
                            showExperInformation() {
                                ga('send', 'event', 'Dashboard_index', 'button_click', '5G網速體驗_注意事項');
                                uba('W1001');
                                document.getElementById('showExperInformation-modal').className = "modal show";
                            },
                            // 年繳顯示指示資訊
                            annualPanel(isAnnual, annualList) {
                                let info = {
                                    isAnnual: isAnnual, // 年繳試算
                                    list: annualList,   // 年繳紀錄
                                    panel: false,       // 年繳面板顯示
                                    promo: false,       // 年繳推廣顯示
                                    button: null,       // 面板按鈕文案
                                    last: null,         // 最新一筆年繳紀錄
                                    discount_1: 0,      // 已回饋總額
                                    discount_2: 0,      // 已扣抵總額
                                    discount_3: 0       // 年繳餘額
                                };

                                try {
                                    // 個人戶
                                    if ('${IS_RESIDENT}' === 'true') {
                                        // 可申請
                                        const applicable = isAnnual && (isAnnual.allowed === 'Y' || isAnnual.allowed === 'R');
                                        // 有申請紀錄
                                        const hasRecord = annualList && annualList.length > 0;

                                        // 未有紀錄且可新申請
                                        if (applicable && !hasRecord) {
                                            info = {...info, promo: true};
                                        }
                                        // 有申請紀錄
                                        else if (hasRecord) {
                                            // 最新一期開始日
                                            const lastStartDate = moment(annualList[0].startdate, 'YYYY/MM/DD HH:mm:ss');
                                            // 最新一期期滿日
                                            const lastEndDate = moment(annualList[0].enddate, 'YYYY/MM/DD HH:mm:ss');
                                            // 最新一期可續繳起始日
                                            const lastRenewStartDate = moment(annualList[0].renewstartdate, 'YYYY/MM/DD HH:mm:ss');

                                            // 目前不可申請
                                            if (!applicable) {
                                                // 即將啟用
                                                const readyApply = annualList[0].status === 'I';
                                                // 使用中：啟用日 ~ 可續繳日
                                                const inUse = moment().isBetween(lastStartDate, lastRenewStartDate);
                                                // Billing紀錄：判斷是否Billing尚未有紀錄
                                                const billingInfo = annualList[0].billinginfolist.wsBILLINGINFO;

                                                info = {
                                                    ...info,
                                                    panel: (readyApply || inUse) && !!billingInfo,
                                                    promo: false,
                                                    last: annualList[0],
                                                    discount_1: billingInfo ? billingInfo.filter(i => i.discountdesc === '年繳月租費回饋').pop().usedamt : 0,
                                                    discount_2: billingInfo ? billingInfo.filter(i => i.discountdesc === '年繳月租費扣抵').pop().usedamt : 0,
                                                    discount_3: billingInfo ? billingInfo.filter(i => i.discountdesc === '年繳月租費扣抵').pop().remainamt : 0
                                                };
                                            }
                                            // 目前可申請
                                            else {
                                                // 即將到期：可續繳日 ~ 期滿日
                                                const almostEnd = moment().isBetween(lastRenewStartDate.clone(), lastEndDate.clone());
                                                // 已到期：期滿日 ~ 期滿日+2M
                                                const hasEnded = moment().isBetween(lastEndDate.clone(), lastEndDate.clone().add(2, 'M'));
                                                // 視同新申請：期滿日+2M之後
                                                const newApply = moment().isSameOrAfter(lastEndDate.clone().add(2, 'M'));

                                                info = {
                                                    ...info,
                                                    panel: almostEnd || hasEnded,
                                                    promo: newApply,
                                                    button: hasEnded ? '再次申請，續享3%回饋' : almostEnd ? '立即續繳，享3%回饋' : null,
                                                    last: annualList[0],
                                                    discount_1: annualList[0].billinginfolist.wsBILLINGINFO.filter(i => i.discountdesc === '年繳月租費回饋').pop().usedamt,
                                                    discount_2: annualList[0].billinginfolist.wsBILLINGINFO.filter(i => i.discountdesc === '年繳月租費扣抵').pop().usedamt,
                                                    discount_3: annualList[0].billinginfolist.wsBILLINGINFO.filter(i => i.discountdesc === '年繳月租費扣抵').pop().remainamt
                                                };

                                                console.log(info);
                                            }
                                        }
                                    }
                                } catch (e) {
                                    console.error(e);
                                }

                                return info;
                            }
                        },
                        computed: {
                            // 確認行動裝置
                            isMobile() {
                                let check = false;
                                let agent = navigator.userAgent || navigator.vendor || window.opera;
                                if (/(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|mobile.+firefox|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows ce|xda|xiino|android|ipad|playbook|silk/i.test(agent) || /1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i.test(agent.substr(0, 4))) check = true;
                                this.window.inMobile = check;

                                return check;
                            },
                            // 依用量類型區分四格or五格顯示
                            volumeGrid() {
                                return {
                                    'col_4': this.unbillInfo.interfree === 'N' || this.mcProfile.companyId !== '035' || this.mcProfile.gsmToLteFlag === '1', // 5G非吃到飽，4G，3G轉4G
                                    'col_5': this.unbillInfo.interfree === 'Y' && this.mcProfile.companyId === '035' // 5G吃到飽
                                };
                            },
                            cgcHistory() {
                                // 非群首才有歷程紀錄
                                if (this.cgc && this.cgc.isMASTER === 'N') {
                                    try {
                                        return this.cgc.memoLists.string.pop();
                                    } catch (e) {
                                        console.error(e);
                                    }
                                }
                                return '';
                            },
                            // 隱藏專案：用多少付多少
                            hideProject() {
                                // 隱藏專案代碼
                                const hideProjectCodes = '${normal.t5}'.split(',');
                                return hideProjectCodes.includes(this.mcProfile.projectCode);
                            }
                        },
                        filters: {
                            currency(val) {
                                if (!val) return '$0';
                                return '$' + numeral(parseInt(val)).format('0,0[.]00');
                            },
                            formatDate(val) {
                                if (!val) return '';
                                return val.substring(0, 4) + '/' + val.substring(4, 6) + '/' + val.substring(6);
                            }
                        }
                    });
                    uba('MC_W02');
                </script>
			</c:when>
			<c:when test="${IS_PREPAY}">
				<link rel="stylesheet" href="resources/rwd_c_108/css/prepaid_member_card_info.css">
				<link rel="stylesheet" href="resources/rwd_c_108/css/prepaid_info.css">
				<link rel="stylesheet" href="resources/rwd_c_108/css/0704.css">
				<div id="<p:iId/>" style="display: none;">
					<div class="prepaid_member_card_info ts-member-top">
						<div class="ts-container">
							<div class="ts-widget-group">
								<div class="ts-widget user-card user-card--prepaid">
									<div class="name">
										Hi ${hidden_code_name} <a onclick="ga('send', 'event', 'Dashboard_prepaid', 'page_click', 'Card_Gear')"
											href="<spring:eval expression="@environment.getProperty(\'MC_DOMAIN_URL\')"/>/MyTstar/member-info.action" class="btn btn-link"><i
											class="icon icon-settings"></i></a>
									</div>
									<div class="phone">${hidden_code_isdn}</div>
									<div class="bottom">
										<div class="level">預付卡用戶</div>
										<!--BARCODE CONSOLE-->
										<barcode-console :pid="`${pid}`" :role="`prepaid`"></barcode-console>
									</div>
									<div class="shadows"></div>
								</div>
								<div class="ts-widget use-status">
									<div class="item-group col_2">
										<div class="item">
											<div class="main-text">
												{{mergeVolumeLeft ? mergeVolumeLeft : 0}}<span>MB</span>
											</div>
											計量型(剩餘量)<br />可用{{mergeVolume ? mergeVolume : 0}}MB
										</div>
										<div class="item">
											<div v-if="residue1Days > 0" class="main-text">
												{{residue1Days}}<span>日</span> {{residue1Hours}}<span>小時</span>
											</div>
											<div v-else-if="residue1Days === 0 && residue1Hours > 0" class="main-text">
												{{residue1Hours}}<span>小時</span>
											</div>
											<div v-else class="main-text">
												0<span>小時</span>
											</div>
											計日型(剩餘量)<br />
											<div v-if="!!endDate1">
												{{endDate1}} <span class="inline-block">{{endTimeAmPm}} {{endTime1}}到期</span>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<c:if test="${not empty normal.flag1 && normal.flag1 == 'Y'}">
						<div v-show="onTheWayOrders && onTheWayOrders.length > 0" class="order_status">
							<div class="ts-container">
								<div class="heading">訂單動態</div>
								<div class="ts-widget">
									<!--ORDER CONSOLE-->
									<order-console :list="onTheWayOrders" :type="`dynamic`" :role="`prepaid`"></order-console>
								</div>
							</div>
						</div>
					</c:if>
					<div class="prepaid_info">
						<div class="ts-container">
							<div class="ts-widget-group">
								<div class="ts-widget prepaid-numbermanage">
									<div class="ts-widget__header">
										<h3 class="heading">門號資訊</h3>
										<div class="ts-widget__header-action">
											<a onclick="ga('send', 'event', 'Dashboard_prepaid', 'page_click', '門號資訊_看更多')"
												href="<spring:eval expression="@environment.getProperty(\'MC_SSO_MY_DATA\')"/>">看更多<i class="icon icon-chevron_right"></i></a>
										</div>
									</div>
									<div class="ts-widget__content">
										<div class="list">
											<div class="item">
												<div class="col col-left">門號效期</div>
												<div class="col col-right">{{validDate}}</div>
											</div>
											<div class="item">
												<div class="col col-left">可用餘額</div>
												<div class="col col-right">{{'$' + intAmount}}</div>
											</div>
										</div>
									</div>
									<div class="ts-widget__footer">
										<a onclick="ga('send', 'event', 'Dashboard_prepaid', 'page_click', '門號資訊_快速儲值')" href="<p:base/>/CWS/prepaidCard.php"
											class="btn btn-secondary">快速儲值</a> <a onclick="ga('send', 'event', 'Dashboard_prepaid', 'page_click', '門號資訊_儲值紀錄')"
											href="<spring:eval expression="@environment.getProperty(\'MC_SSO_MY_DATA\')"/>" class="btn btn-secondary">儲值紀錄</a>
									</div>
								</div>

								<!-- 優惠卷 原PDR CONSOLE-->
								<div class="ts-widget" v-if="pdrStatus.status !== '6'">
									<div class="ts-widget__header">
										<h3 class="heading">優惠卷</h3>
									</div>
									<div class="ts-widget__content">
										<div class="list">
											<div class="item">
												<div class="col col-left">擁有優惠券</div>
												<div class="col col-right">{{pdrStatus.couponAmount}}張</div>
											</div>
											<div class="item">
												<div class="col col-left">查詢優惠券</div>
												<div class="col col-right">
													<a href="<p:base/>/CWS/Dashboard_coupon.php" class="btn btn-link"
														onclick="ga('send', 'event', 'Dashboard_prepaid', 'page_click', 'PDR_優惠券');uba('MC_W05');"><i class="icon icon-chevron_right"></i></a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<c:if test="${not empty normal.flag2 && normal.flag2 == 'Y'}">
								<div v-show="top10Orders && top10Orders.length > 0" class="ts-widget order-overview">
									<div class="ts-widget__header">
										<h3 class="heading">訂單總覽</h3>
										<div class="ts-widget__header-action">
											<a onclick="ga('send', 'event', 'Dashboard_prepaid', 'page_click', '訂單總覽_看更多')" href="<p:base/>/CWS/Dashboard_order.php">看更多<i
												class="icon icon-chevron_right"></i></a>
										</div>
									</div>
									<div class="ts-widget__content">
										<!--ORDER CONSOLE-->
										<order-console :list="top10Orders" :type="`overview`" :role="`prepaid`"></order-console>
									</div>
								</div>
							</c:if>
						</div>
					</div>
				</div>
				<script language="javascript">
                    const vm = new Vue({
                        el: '<p:iId prefix="#"/>',
                        data: {
                            // 計日型剩餘天數
                            residue1Days: 0,
                            // 計日型剩餘小時
                            residue1Hours: 0,
                            // 計日型結束日
                            endDate1: null,
                            // 計日型結束時
                            endTime1: null,
                            // 計日型結束上下午
                            endTimeAmPm: null,
                            // 計量型累積量
                            mergeVolume: null,
                            // 計量型剩餘量
                            mergeVolumeLeft: null,
                            // 門號有效期
                            validDate: null,
                            // 可用餘額
                            intAmount: 0,
                            // 在途訂單
                            onTheWayOrders: [],
                            // 前10訂單
                            top10Orders: [],
                            // 購物金狀態
                            pdrStatus: {},
                            window: {
                                width: 0,
                                inMobile: false
                            }
                        },
                        created() {
                            // 設定loading樣式
                            $('body').loadingModal({'animation': 'fadingCircle'});
                            this.isMobile()
                            $.post('<p:base/>/rest/dashboard/prepay')
                             .done(resp => {
                                 this.residue1Days = resp.residue1Days;
                                 this.residue1Hours = resp.residue1Hours;
                                 this.endDate1 = resp.endDate1;
                                 this.endTime1 = resp.endTime1;
                                 this.endTimeAmPm = resp.endTimeAmPm;
                                 this.mergeVolume = numeral(resp.mergeVolume).format('0,0[.]00');
                                 this.mergeVolumeLeft = numeral(resp.mergeVolumeLeft).format('0,0[.]00');
                                 this.validDate = resp.validDate;
                                 this.intAmount = resp.intAmount;
                                 this.onTheWayOrders = resp.onTheWayOrders ? resp.onTheWayOrders : [];
                                 this.top10Orders = resp.top10Orders ? resp.top10Orders : [];
                                 this.pdrStatus = resp.pdrStatus ? resp.pdrStatus : {};
                             })
                             .always(() => {
                                 $('body').loadingModal('hide');
                                 $('<p:iId prefix="#"/>').show();
                             });
                        },
                        methods: {
                            isMobile() {
                                let check = false;
                                let agent = navigator.userAgent || navigator.vendor || window.opera;
                                if (/(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|mobile.+firefox|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows ce|xda|xiino|android|ipad|playbook|silk/i.test(agent) || /1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i.test(agent.substr(0, 4))) check = true;
                                this.window.inMobile = check;
                                return check;
                            }
                        },
                        filters: {
                            currency(val) {
                                if (!val) return '0';
                                return '$' + numeral(parseInt(val)).format('0,0[.]00');
                            }
                        }
                    });
                    uba('MC_W02');
                </script>
			</c:when>
			<c:when test="${IS_NON_TS}">
				<link rel="stylesheet" href="resources/rwd_c_108/css/nonTS_member_card_PDR.css">
				<link rel="stylesheet" href="resources/rwd_c_108/css/Banner.css">
				<link rel="stylesheet" href="resources/rwd_c_108/css/owl.carousel.min.css">
				<link rel="stylesheet" href="resources/rwd_c_108/css/owl.theme.default.css">
				<div id="<p:iId/>" style="display: none;">
					<div class="nonTS_member_card_PDR ts-member-top">
						<div class="ts-container">
							<div class="ts-widget-group">
								<div class="ts-widget user-card user-card--nonTS">
									<div class="name">
										Hi 親愛的會員 <a onclick="ga('send', 'event', 'Dashboard_non-user', 'page_click', 'Card_Gear')"
											href="<spring:eval expression="@environment.getProperty(\'MC_DOMAIN_URL\')"/>/MyTstar/member-info.action" class="btn btn-link"><i
											class="icon icon-settings"></i></a>
									</div>
									<div class="phone">${hidden_code_isdn}</div>
									<div class="bottom">
										<div class="level">非電信用戶</div>
										<!--BARCODE CONSOLE-->
										<barcode-console :pid="`${pid}`" :role="`nonTS`"></barcode-console>
									</div>
									<div class="shadows"></div>
								</div>
								<!-- 優惠卷 原PDR CONSOLE-->
								<div class="ts-widget" v-if="pdrStatus.status !== '6'">
									<div class="ts-widget__header">
										<h3 class="heading">優惠卷</h3>
									</div>
									<div class="ts-widget__content">
										<div class="list">
											<div class="item">
												<div class="col col-left">擁有優惠券</div>
												<div class="col col-right">{{pdrStatus.couponAmount}}張</div>
											</div>
											<div class="item">
												<div class="col col-left">查詢優惠券</div>
												<div class="col col-right">
													<a href="<p:base/>/CWS/Dashboard_coupon.php" class="btn btn-link"
														onclick="ga('send', 'event', 'Dashboard_non-user', 'page_click', 'PDR_優惠券');uba('MC_W05');"><i class="icon icon-chevron_right"></i></a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<c:if test="${not empty normal.flag1 && normal.flag1 == 'Y'}">
						<div v-show="onTheWayOrders && onTheWayOrders.length > 0" class="order_status">
							<div class="ts-container">
								<div class="heading">訂單動態</div>
								<div class="ts-widget">
									<!--ORDER CONSOLE-->
									<order-console :list="onTheWayOrders" :type="`dynamic`" :role="`nonTS`"></order-console>
								</div>
							</div>
						</div>
					</c:if>
					<c:if test="${not empty normal.flag2 && normal.flag2 == 'Y'}">
						<div v-show="top10Orders && top10Orders.length > 0" class="ts-container" style="padding-bottom: 10px;">
							<div class="ts-widget order-overview">
								<div class="ts-widget__header">
									<h3 class="heading">訂單總覽</h3>
									<div class="ts-widget__header-action">
										<a href="<p:base/>/CWS/Dashboard_order.php" onclick="ga('send', 'event', 'Dashboard_non-user', 'page_click', '訂單總覽_看更多')">看更多<i
											class="icon icon-chevron_right"></i></a>
									</div>
								</div>
								<div class="ts-widget__content">
									<!--ORDER CONSOLE-->
									<order-console :list="top10Orders" :type="`overview`" :role="`nonTS`"></order-console>
								</div>
							</div>
						</div>
					</c:if>
					<div v-if="bannerCount > 0" class="Banner">
						<div class="ts-container">
							<div class="ts-widget carousel-wrap">
								<div id="BottomCarousel" class="owl-carousel owl-theme">
									<c:forEach var="image" items="${attrs}">
										<a class="owl-carousel-item" href="<c:out value="${image.u1}" default="javascript:"/>"
											<c:if test="${image.u1Target=='new'}">target="_blank"</c:if>>
											<div class="owl-carousel-item__content">
												<c:if test="${not empty image.i1}">
													<p:image src="${image.i1}" cdn="true" />
												</c:if>
											</div>
										</a>
									</c:forEach>
								</div>
								<div id="BottomCarouselDots" class="owl-dots">
									<c:set var="bannerCount" value="0" />
									<c:forEach var="image" items="${attrs}" varStatus="stat">
										<c:if test="${not empty image.i1}">
											<c:set var="bannerCount" value="${stat.count}" />
											<div class="owl-dot"></div>
										</c:if>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
				</div>
				<script src="resources/rwd_c_108/js/owl.carousel.min.js"></script>
				<script language="javascript">
                    const vm = new Vue({
                        el: '<p:iId prefix="#"/>',
                        data: {
                            // 在途訂單
                            onTheWayOrders: [],
                            // 前10訂單
                            top10Orders: [],
                            // 購物金狀態
                            pdrStatus: {},
                            // 輪播圖總數
                            bannerCount: ${bannerCount},
                            window: {
                                width: 0,
                                inMobile: false
                            }
                        },
                        created() {
                            // 設定loading樣式
                            $('body').loadingModal({'animation': 'fadingCircle'});
                            this.isMobile();
                            $.post('<p:base/>/rest/dashboard/nonTS')
                             .done(resp => {
                                 this.onTheWayOrders = resp.onTheWayOrders ? resp.onTheWayOrders : [];
                                 this.top10Orders = resp.top10Orders ? resp.top10Orders : [];
                                 this.pdrStatus = resp.pdrStatus ? resp.pdrStatus : {};
                             })
                             .always(() => {
                                 $('body').loadingModal('hide');
                             });
                        },
                        methods: {
                            isMobile() {
                                let check = false;
                                let agent = navigator.userAgent || navigator.vendor || window.opera;
                                if (/(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|mobile.+firefox|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows ce|xda|xiino|android|ipad|playbook|silk/i.test(agent) || /1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i.test(agent.substr(0, 4))) check = true;
                                this.window.inMobile = check;

                                return check;
                            }
                        },
                        filters: {
                            currency(val) {
                                if (!val) return '0';
                                return '$' + numeral(parseInt(val)).format('0,0[.]00');
                            }
                        }
                    });

                    Vue.nextTick(function () {
                        // 設定輪播組件
                        const bottomOwl = $("#BottomCarousel");
                        bottomOwl.owlCarousel({
                            autoplayTimeout: 5000,
                            autoplaySpeed: 1000,
                            loop: true,
                            autoWidth: true,
                            items: 4,
                            margin: 8,
                            merge: true,
                            dotsContainer: '#BottomCarouselDots',
                            responsive: {
                                0: {
                                    items: 1,
                                },
                                600: {
                                    items: 3,
                                },
                                1000: {
                                    items: 4,
                                }
                            }
                        });
                        bottomOwl.on('changed.owl.carousel', function (e) {
                            bottomOwl.trigger('stop.owl.autoplay');
                            bottomOwl.trigger('play.owl.autoplay');
                        });
                        $('#BottomCarouselDots .owl-dot').click(function () {
                            bottomOwl.trigger('to.owl.carousel', [$(this).index(), 300]);
                        });

                        $('<p:iId prefix="#"/>').show();
                    }.bind(vm));

                    uba('MC_W02');
                </script>
			</c:when>
		</c:choose>
	</p:identity>
	<style scope>
.swal2-icon.swal2-success .swal2-success-ring {
	border-color: black !important;
}

.swal2-icon.swal2-success.swal2-icon-show .swal2-success-line-tip {
	background-color: black !important;
}

.swal2-icon.swal2-success.swal2-icon-show .swal2-success-line-long {
	background-color: black !important;
}
</style>

</p:login>
<p:logoff>
	<script language="javascript">
        window.location.href = '${login_url}';
    </script>
</p:logoff>
