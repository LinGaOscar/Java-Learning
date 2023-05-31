<%--原 ms057 改--%>
<%@ page session="false" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.tstartel.com/CWS/tag" prefix="p"%>
<p:attrs id="twm_s_004" />
<c:set var="attr" value="${attrs[0]}" />

<!-- 元件開始 -->
<p:login>
	<p:identity>
		<c:choose>
			<c:when test="${IS_POSTPAY}">
				<link rel="stylesheet" type="text/css" href="resources/twm_s_004/css/twms004.css" />
				<link rel="stylesheet" type="text/css" href="resources/twm_s_004/css/paternity.css">
				<script type="text/javascript" src="resources/common/js/lodash.min.js"></script>
				<script type="text/javascript" src="resources/common/js/knockout.js"></script>
				<section id="<p:iId/>" style="display: none;">
					<h2 class="tm_sec_title">我的帳單</h2>
					<!-- Tab Switch -->
					<div class="tab-wrap">
						<div class="tab-grid3">
							<div data-bind="css: {'active':currentTopTab() == 'bill'}">
								<a data-bind="click: function(){currentTopTab('bill')}" href="javascript:void(0);"><span>帳單/繳款</span></a>
							</div>
							<div data-bind="css: {'active':currentTopTab() == 'payment'}">
								<a data-bind="click: function(){currentTopTab('payment')}" href="javascript:void(0);"><span>繳款紀錄</span></a>
							</div>
						</div>
					</div>
					<!-- Tab Block: 帳單/繳款 -->
					<div class="white-wrap bill_preview">
						<p class="tx-pink">
							累積未繳款金額<span data-bind="text: shouldPay() + '元'"></span>
						</p>
						<p>
							繳款截止日<span data-bind="text: payEndDate"></span>
						</p>
						<div class="row action">
							<button data-bind="lightbox: '#paymentWays'" class="mc_btn w100" onclick="ga('send', 'event', '我的帳單', 'Button click', '我的帳單_我要繳款')">立即繳款</button>
						</div>
					</div>
					<div class="white-wrap bill_preview">
						<p>目前尚無出帳紀錄，建議於門號結帳日後再行查詢，謝謝。</p>
					</div>
					<div class="white-popup mfp-hide" id="paymentWays">
						<div class="mfp_title">立即繳款</div>
						<table class="middle center" style="margin-bottom: 10px;">
							<tr>
								<th colspan="2">選擇繳款方式</th>
							</tr>
							<tr>
								<td class="left"><input type="radio" name="payWay" id="payWay_creditcard"
									onclick="window.location.href='TWM/bill-pay-creditcard.php';ga('send', 'event', '我的帳單', 'Button click', '我的帳單(mobile)_信用卡繳款')"></td>
								<td class="right"><label for="payWay_creditcard">信用卡繳款</label></td>
							</tr>
							<tr>
								<td class="left"><input type="radio" name="payWay" id="payWay_bank"
									onclick="window.location.href='TWM/bill-pay-bank.php';ga('send', 'event', '我的帳單', 'Button click', '我的帳單(mobile)_銀行帳戶繳款')"></td>
								<td class="right"><label for="payWay_bank">銀行帳戶繳款</label></td>
							</tr>
							<tr>
								<td class="left"><input type="radio" name="payWay" id="payWay_barcode"
									onclick="window.location.href='TWM/ebc-store.php';ga('send', 'event', '我的帳單', 'Button click', '我的帳單(mobile)_超商繳費條碼');sendCode({'name':'超商繳費條碼','value':'M0703'});"></td>
								<td class="right"><label for="payWay_barcode">超商繳費條碼</label></td>
							</tr>
						</table>
					</div>
					<div>
						<div class="slide_title" data-bind="text: billYearMonth(), slideDown: '.slide_title_detail'"></div>
						<div class="slide_title_detail">
							<div class="white-wrap">
								<!-- 繳款資訊 -->
								<table class="interval-pay">
									<tbody>
										<tr>
											<th>門號</th>
											<td>${MASK_MSISDN_TWM}</td>
										</tr>
										<tr>
											<th>出帳日</th>
											<td data-bind="text: billsdate"></td>
										</tr>
										<tr>
											<th>繳費截止日</th>
											<td data-bind="text: payendtime"></td>
										</tr>
										<tr>
											<th>前期應繳</th>
											<td data-bind="text: priorpay"></td>
										</tr>
										<tr>
											<th>本期新增</th>
											<td data-bind="text: currtappend"></td>
										</tr>
										<tr>
											<td colspan="2" style="text-align: left; font-size: 14px; background: #f7f7f7"><span data-bind="if: $root.custType() == '0'"
												class="table_purple">上方顯示為帳單之總金額(如為合併帳單，將顯示合併帳之總金額)，下方為所有門號之費用項目。</span> <span data-bind="if: $root.custType() == '1'"
												class="table_purple">上方顯示為帳單之總金額(如為合併帳單，將顯示合併帳之總金額)，下方為登入門號之帳單費用項目，非合併帳單所有門號之費用項目。如欲查看所有門號之費用項目，請洽官網查詢。</span></td>
										</tr>
									</tbody>
								</table>
								<br>
								<!-- 帳單明細 -->
								<table class="interval-pay">
									<tbody>
										<tr>
											<th data-bind="text: $parent.phoneMask(groupPhone)" style="text-decoration: underline; font-size: 15px;"></th>
											<td>金額(元)</td>
										</tr>
										<tr>
											<th data-bind="text: '【' + groupItem + '】'" class="group-padding"></th>
											<td></td>
										</tr>
										<tr>
											<th data-bind="text: itemdesc"></th>
											<td data-bind="text: revenuemny"></td>
										</tr>
										<!-- 帳單下載 -->
										<tr data-bind="if: detailShow() === 'Y'">
											<td colspan="2" style="text-align: center; font-size: 14px; background: #f7f7f7"><a
												data-bind="click: doDownload, if: !isDownloading()" href="javascript:;"> <span class="table_purple">請點此查看通話明細<br>(開啟密碼：身分證號後六碼)
												</span>
											</a> <span data-bind="if: isDownloading()" class="table_purple"> <img src="resources/twm_s_004/images/loading.gif"
													style="display: block; margin: auto;" />
											</span></td>
										</tr>
										<tr data-bind="if: detailShow() === 'N'">
											<td colspan="2" style="text-align: center; font-size: 14px; background: #f7f7f7"><span class="table_purple">本月無通話明細</span></td>
										</tr>
									</tbody>
								</table>
								<table class="interval-pay">
									<tr>
										<td colspan="2" style="text-align: center; font-size: 14px; background: #f7f7f7"><span class="table_purple">本月份帳單已合併，請改以主門號登入，謝謝。</span>
										</td>
									</tr>
								</table>
							</div>
						</div>
					</div>

					<!-- Tab Block: 繳款記錄 -->
					<div class="white-wrap">
						<table class='interval-T'>
							<tbody>
								<tr>
									<th>繳款日期</th>
									<td data-bind="text: paydat"></td>
								</tr>
								<tr>
									<th>繳款管道</th>
									<td data-bind="text: institution"></td>
								</tr>
								<tr>
									<th>繳款方式</th>
									<td data-bind="text: paymentchannel"></td>
								</tr>
								<tr>
									<th>繳款金額</th>
									<td data-bind="text: payamt + '元'"></td>
								</tr>
							</tbody>
						</table>
						<br />
						<table>
							<tbody>
								<tr>
									<td></td>
								</tr>
								<tr>
									<td>無歷史繳款記錄！</td>
								</tr>
						</table>
					</div>
					<div>
						<!-- 貼心提醒 顯示 -->
						<c:if test="${not empty attr.h1}">
							<div class="notes">
								<h5 data-bind="slideDown: 'div'" class="active">貼心提醒</h5>
								<div style="display: block;" class="white-wrap">
									<p:htmlOut text="${attr.h1}" />
								</div>
							</div>
						</c:if>
					</div>
				</section>
				<script language="javascript" type="text/javascript">
                    var maxCRDCount = parseInt('${attr.t1}') || 9000; //預設最大可顯示通話明細總數
                    var downloadTimeout = parseInt('${attr.t2}') || 60000; //預設下載timeout時限
                    var currentTab = '<c:out value="${param.tab}"/>' || 'bill'; //指定tab

                    $(function () {
                        $('main').addClass('paternity');

                        <!-- 綁定：自定義Lightbox binding -->
                        ko.bindingHandlers.lightbox = {
                            init: function (element, valueAccessor) {
                                $(element).magnificPopup({
                                    type: 'inline',
                                    prependTo: document.getElementById('<p:iId/>'),
                                    items: {src: valueAccessor()}
                                });
                            }
                        };
                        <!-- 綁定：自定義slideDown binding -->
                        ko.bindingHandlers.slideDown = {
                            init: function (element, valueAccessor) {
                                $(element).click(function () {
                                    $(element).next(valueAccessor()).slideToggle('fast');
                                    $(element).toggleClass('open active');
                                });
                            }
                        };
                        <%--避免IE Ajax-get cache--%>
                        $.ajaxSetup({cache: false, contentType: "application/json; charset=utf-8"});
                        <%--初始化MVVM物件--%>
                        var dataModel = new DataModel();
                        ko.applyBindings(dataModel, document.getElementById('<p:iId/>'));
                        dataModel.init();
                    });

                    function DataModel() {
                        var self = this;
                        <%-- 目前tab --%>
                        self.currentTopTab = ko.observable(currentTab);

                        <%-- 是否為主門號 --%>
                        self.isMainMsisdn = ko.observable(true);
                        <%-- 客戶類型：0（個人）| 1（企業） --%>
                        self.custType = ko.observable('0');
                        <%-- 累積未繳款金額 --%>
                        self.shouldPay = ko.observable(0);
                        <%-- 繳費截止日 --%>
                        self.payEndDate = ko.observable('');
                        <%-- 帳單列表 --%>
                        self.billList = ko.observableArray([]);
                        <%-- 顯示帳單資訊 --%>
                        self.showBillInfo = ko.observable(false);

                        <%-- 繳款列表 --%>
                        self.paymentList = ko.observableArray([]);

                        <%-- 初始化 --%>
                        self.init = function () {
                            loading();
                            $.when($.get('<p:base/>/rest/billService/billList/mCWS'), $.get('<p:base/>/rest/billService/PayBillhist'))
                             .then(function (data1, data2) {
                                 var bill = data1[0];
                                 self.isMainMsisdn(bill.isMainMsisdn === 'Y');
                                 self.custType(bill.custType);

                                 if (bill && bill.billList.length > 0 && bill.pdfList.length > 0) {
                                     self.showBillInfo(true);

                                     if (self.isMainMsisdn()) {
                                         <%-- 累積未繳款金額 --%>
                                         self.shouldPay(bill.needPay);
                                         <%-- 繳款截止日 --%>
                                         if (bill.pdfList && bill.pdfList.length > 0) self.payEndDate(bill.pdfList[0].paymentenddate);
                                     }

                                     <%-- 建立 BillItem 物件 --%>
                                     var billItems = bill.billList.map(function (b) {
                                         <%-- 過濾帳單日期是否有通話明細PDF --%>
                                         var pdfInfo = bill.pdfList.filter(function (p) { return b.billsdate === p.billdate && p.billclass === 'T';}).pop();
                                         return new BillItem(b, pdfInfo);
                                     });
                                     self.billList(billItems);
                                 } else if (bill.isMainMsisdn === 'N') {
                                     alert("親愛的用戶您好：本門號帳單已合併，請改以主門號登入，謝謝。");
                                     location.href = '<p:base/>/TWM/Dashboard_index.php';// 子門號合併
                                 }

                                 var payment = data2[0];
                                 if (payment && payment.bilhis && payment.bilhis.length > 0) {
                                     self.paymentList(payment.bilhis);
                                 }
                             })
                             .always(function () {
                                 loading('done');
                                 $('<p:iId prefix="#"/>').show();
                             });
                        };
                    }

                    // 帳單物件
                    function BillItem(rawBill, rawPDF) {
                        var self = this;
                        self.billsdate = ko.observable(rawBill.billsdate); //出帳日
                        self.payendtime = ko.observable(rawBill.payendtime); //繳費截止日
                        self.detailList = ko.observableArray([]); //帳單明細
                        self.cdrCount = ko.observable(0); //CDR筆數
                        self.isDownloading = ko.observable(false); //是否正在下載

                        // 判斷是否為子門號虛擬帳單
                        if (self.payendtime() !== 'unavailable') {
                            self.priorpay = ko.observable(rawBill.priorpay); //前期應繳
                            self.currtappend = ko.observable(rawBill.currtappend); //本期新增
                            self.detailList = ko.observableArray(rawBill.billInfoDetail.wsHistoryBillInfoDetail); //帳單明細
                            self.pdfInfo = ko.observable(rawPDF); //PDF link
                            self.detailShow = rawPDF ? ko.observable(rawPDF.detailShow.substring(0, 1)) : ko.observable('N'); //可否下載PDF
                            self.cdrCount = rawPDF ? ko.observable(parseInt(rawPDF.cdrcount)) : ko.observable(0); //CDR筆數
                        }

                        <%-- 帳單年月顯示 --%>
                        self.billYearMonth = function () {
                            return (self.billsdate().split("/")[0] - 1911) + '年' + parseInt(self.billsdate().split("/")[1]) + '月';
                        };
                        <%-- 科目分組 --%>
                        self.groupItems = function () {
                            var sources = _(self.detailList()).groupBy('eventsource') // 先以門號（eventsource）分組
                                                              .map(function (v, k) { return {groupPhone: k, phoneDetails: v};}) // 將Object屬性轉成Array
                                                              .value();
                            sources.sort(function (a, b) { 
                            	return a.groupPhone === '${msisdn}' ? -1 : 1; }).forEach(function (l) { // 先顯示主門號
                                       l.phoneDetails = _(l.phoneDetails).groupBy('itemgroupname') // 再以收費項目（itemgroupname）分組
                                                                         .map(function (v, k) { return {groupItem: k, itemDetails: v};}) // 將Object屬性轉成Array
                                                                         .value();
                                   });
                            return sources;
                        };

                        <%-- 門號隱碼 --%>
                        self.phoneMask = function (msisdn) {
                            return msisdn.split('')
                                         .map(function (cur, idx) { if (idx == 4 || idx == 6 || idx == 8) return '*'; else return cur; })
                                         .join('');
                        };

                        <%-- 是否有通話明細PDF --%>
                        self.doDownload = function () {
                            if (self.cdrCount() > maxCRDCount) {
                                alert('由於您本月通話紀錄筆數較多，建議您至電腦版官網檢視明細');
                                return false;
                            }

                            var pdfPath = '<p:base/>/rest/billService/bill.pdf?token=' + self.pdfInfo().detailInvoiceNumberParameter + "&action=attachment";
                            window.open(pdfPath, '_blank');
                            self.isDownloading(true);
                            setTimeout(function () { self.isDownloading(false);}, downloadTimeout); // 下載逾時(loadingTimeout毫秒)恢復link
                        }
                    }
                </script>
			</c:when>
			<c:when test="${IS_PREPAY}">
				<script language="javascript">
                	alert("很抱歉，預付型門號無帳單。");
                	location.href = '<p:base/>/TWM/Dashboard_index.php';
                </script>
			</c:when>
			<c:otherwise>
				<script language="javascript">
                	alert("親愛的用戶您好：很抱歉，此帳號無法使用帳單查詢功能。");
                	location.href = '<p:base/>/TWM/Dashboard_index.php';
                </script>
			</c:otherwise>
		</c:choose>
	</p:identity>
</p:login>
<p:logoff>
	<script language="javascript">
        location.href = '${login_twm_url}';
    </script>
</p:logoff>