<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta content='text/html;charset=utf-8' http-equiv='Content-Type'>
<meta content='width=device-width, initial-scale=1, maximum-scale=1' name='viewport'>
<meta content='yes' name='apple-mobile-web-app-capable'>
<meta content='yes' name='mobile-web-app-capable'>
<meta content='black-translucent' name='apple-mobile-web-app-status-bar-style'>
<meta content='webkit' name='renderer'>
<meta content='#F55D54' name='theme-color'>
<title>
教師排課系統 test123测试
</title>
<link href='images/icon_android.png' rel='icon' sizes='192x192'>
<link href='images/icon_retina.png' rel='apple-touch-icon' sizes='120x120'>
<link href='images/icon_retina3x.png' rel='apple-touch-icon' sizes='180x180'>
<link href='images/icon_ipad.png' rel='apple-touch-icon' sizes='144x144'>
<link href='images/icon_ipad.png' rel='apple-touch-icon' sizes='152x152'>
<link href='images/splashes/retina.png' media='(device-width: 320px) and (device-height: 568px)' rel='apple-touch-startup-image'>
<link href='images/splashes/iphone4_portrait_retina.png' media='(device-width: 320px) and (device-height: 480px)' rel='apple-touch-startup-image'>
<link href='images/splashes/iphone6_portrait_retina.png' media='(device-width: 375px) and (device-height: 667px)' rel='apple-touch-startup-image'>
<link href='images/splashes/iphone6plus_portrait_retina.png' media='(device-width: 414px) and (device-height: 736px)' rel='apple-touch-startup-image'>
<link href='images/splashes/ipad_portrait_retina.png' media='(device-width: 768px) and (device-height: 1024px) and (orientation:portrait)' rel='apple-touch-startup-image'>
<link href='images/splashes/ipad_landscape_retina.png' media='(device-width: 768px) and (device-height: 1024px) and (orientation:landscape)' rel='apple-touch-startup-image'>
<style>
  html, body {
    font-family: -apple-system, "SF UI Text", "Helvetica Neue", Arial, "PingFang SC", "Hiragino Sans GB", "Microsoft YaHei", "WenQuanYi Zen Hei", sans-serif;
    font-size: 12px;
    font-weight: normal;
    line-height: 18px;
    overflow: hidden;
    height: 100%; }
  
  body {
    background: whitesmoke;
    color: #525e71; }
    body.mobile {
      background-color: white; }
  
  #download, #header {
    display: none; }
  
  #notification {
    position: fixed;
    top: -70px;
    left: 0; }
  
  .notice {
    padding: 10px;
    font-size: 14px; }
    .notice p {
      margin-bottom: 10px; }
  
  .spinner {
    width: 30px;
    height: 30px;
    border-width: 3px;
    border-style: solid;
    border-color: rgba(51, 54, 58, 0.6) transparent;
    border-radius: 100%;
    transform-origin: 50% 50% 0px;
    -webkit-animation: mb-spin 0.8s infinite linear;
    animation: mb-spin 0.8s infinite linear;
    display: inline-block; }
  
  @-webkit-keyframes mb-spin {
    0% {
      -webkit-transform: rotate(0deg);
      transform: rotate(0deg); }
  
    100% {
      -webkit-transform: rotate(359deg);
      transform: rotate(359deg); } }
  
  @keyframes mb-spin {
    0% {
      -webkit-transform: rotate(0deg);
      transform: rotate(0deg); }
  
    100% {
      -webkit-transform: rotate(359deg);
      transform: rotate(359deg); } }
  
  #safemode, #logo, #install, .cover, #device {
    display: none; }
  
  #fontawesome {
    position: absolute;
    top: -65535px;
    left: -65535px; }
    #fontawesome .aw {
      position: absolute;
      width: auto;
      white-space: nowrap; }
    #fontawesome .ah {
      position: absolute;
      height: auto;
      word-break: break-word;
      word-wrap: break-word; }
      #fontawesome .ah p {
        margin-bottom: 5px;
        white-space: pre-wrap; }
        #fontawesome .ah p:last-child {
          margin-bottom: 0px; }
  
  #loading {
    width: 86px;
    height: 86px;
    z-index: 2;
    position: absolute;
    top: 30%;
    left: 50%;
    margin-left: -43px;
    text-align: center;
    font-size: 12px; }
    #loading .logo, #loading .indicator {
      position: absolute;
      top: -3px;
      left: -3px;
      width: 86px;
      height: 86px;
      overflow: hidden;
      background: url("images/logo-lg.svg");
      background-size: 86px 86px; }
    #loading .logo {
      opacity: 0.3; }
    #loading .indicator {
      opacity: 1;
      -webkit-transition: all 0.5s ease-in-out;
      -moz-transition: all 0.5s ease-in-out;
      transition: all 0.5s ease-in-out;
      height: 0%; }
    #loading span {
      position: absolute;
      width: 300px;
      left: 50%;
      top: 110px;
      margin-left: -150px;
      font-size: 14px;
      line-height: 28px;
      color: #f77d77; }
</style>
<style>
  ::-webkit-scrollbar-track {
    background-color: transparent; }
  
  ::-webkit-scrollbar {
    width: 6px;
    height: 6px; }
  
  ::-webkit-scrollbar-thumb {
    background-color: rgba(0, 0, 0, 0.18);
    border-radius: 4px; }
  
  ::-webkit-scrollbar-corner {
    background-color: transparent; }
</style>

<style>
  #splash {
    position: absolute;
    z-index: 3;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: #f0f0f2; }
    #splash.is-landscape img {
      top: 50%;
      left: 50%;
      width: 100vh;
      height: 100vw;
      transform: translate(-50%, -50%) rotate(-90deg); }
    #splash img {
      position: absolute;
      top: 0px;
      left: 0;
      width: 100%;
      height: 100%; }
    #splash .spinner {
      position: absolute;
      top: 50%;
      left: 50%;
      margin-top: -15px;
      margin-left: -15px; }
</style>


<meta name="csrf-param" content="authenticity_token" />
<meta name="csrf-token" content="moCwKZtSWl9orkQph/h4hTIAfq7qEXQGfZxfwKvWoPthI+E3gNGqMxTKyiorLJdkIi9/Pi+3ZLJSyHBdg3gpAg==" />
</head>
<body>
<div id='fontawesome'>
<i class='fa fa-user'></i>
<div class='aw'></div>
<div class='ah'></div>
</div>
<div id='loading'>
<div class='logo'></div>
<div class='indicator'></div>
<span>
正在读取 教師排課系統...
</span>
</div>
<div data-user='null' id='workspace'>
<div id='install'>
<div class='app-inner'>
<img class='app-icon' src='images/icon_android.png'>
<h1 class='app-name'>
教師排課系統
</h1>
<div class='app-update-time'>
<span>
最后更新
:
</span>
<abbr class='timeago' title='2017-11-28T18:39:38+08:00'></abbr>
</div>
<a class='install-btn' href='/app/6MrVIo1xU64YPOrWi64U3PCZ77GOJCh?inapp=1'>
直接查看
</a>
<a class='install install-btn'>
安装
</a>
<a class='download' href='https://itunes.apple.com/cn/app/mockingbot/id1050565468?ls=1&amp;mt=8' id='ios-download'>
下载墨刀客户端获得最佳展示体验
</a>
</div>
</div>
<div class='cover wechat'>
<div class='tip-wrapper'>
<p class='tip'>
在浏览器中打开
</p>
<img class='arrow' src='images/short-arrow.png'>
</div>
</div>
<div class='cover ipad'>
<div class='tip-wrapper'>
<p class='tip'>
请点击
<img src='data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACYAAAA1BAMAAADfUYSoAAAAFVBMVEUAAAAGfv8Eff8Xh/8Ae/cAgfcDev8kxpS2AAAABnRSTlMAgGPrExbGXyRsAAAAYUlEQVQ4y+3MsQ2AMBADQMMEofk6VSZgEyZ4Cu8/Ai+QXgpOmTJuYp2cR+aAZGMRM7rOKENzmss1/i/aDaJ5P6thO0s/C0OLJ3PV1/YTfZhtuvFLlOxjk7/LphmWTTPJ0B64+0mEocrEDQAAAABJRU5ErkJggg==' width='19'>
,
然后选择&quot;添加到主屏幕&quot;.
</p>
<img class='arrow' src='images/short-arrow.png'>
</div>
</div>
<div class='cover iphone'>
<div class='tip-wrapper iphone'>
<p class='tip'>
请点击
<img src='data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACYAAAA1BAMAAADfUYSoAAAAFVBMVEUAAAAGfv8Eff8Xh/8Ae/cAgfcDev8kxpS2AAAABnRSTlMAgGPrExbGXyRsAAAAYUlEQVQ4y+3MsQ2AMBADQMMEofk6VSZgEyZ4Cu8/Ai+QXgpOmTJuYp2cR+aAZGMRM7rOKENzmss1/i/aDaJ5P6thO0s/C0OLJ3PV1/YTfZhtuvFLlOxjk7/LphmWTTPJ0B64+0mEocrEDQAAAABJRU5ErkJggg==' width='19'>
,
然后选择&quot;添加到主屏幕&quot;.
</p>
<img class='arrow' src='images/down-arrow.png'>
</div>
</div>
<div class='cover building'>
<div class='tip-wrapper'>
<p class='tip'>
正在生成 APK 文件
</p>
<div class='spinner'></div>
</div>
</div>
</div>
<div class='safe-mask' id='safemode'>
<div class='indicator restore'>
<div class='spinner'></div>
<div class='text'>
此操作可能需要几分钟，请您耐心等待…
<span class='progress'>0%</span>
</div>
</div>
</div>


<script>
  (function() {
    window.MBLocale = 'zh-CN';
  
    window.I18N = {
      "are_you_sure": "您确定要执行此操作吗？",
      "choose_app": "选择一个项目",
      "hdistribute": "水平等间距",
      "vdistribute": "垂直等间距",
      "please_validate_email": "请验证您的 Email",
      "password_protection": "升级帐户添加密码保护",
      "duplicate_all": "连同子页面一起复制",
      "duplicate_parent_only": "只复制父页面",
      "choose_move_dst": "选择移动位置",
      "no_privilege": "对不起，您没有足够的权限执行此操作。",
      "projects_count": "项目",
      "no_permission": "对不起，您没有权限编辑此母版，请双击实例进行编辑。",
      "renew_now": "立即升级",
      "account_expired": "帐户已过期",
      "create": "创建",
      "setting": "设置",
      "update": "更新",
      "delete": "删除",
      "edit": "编辑",
      "archive": "移入归档项目",
      "sharing": "分享",
      "archived": "归档项目",
      "last_updated": "最后更新",
      "support": "技术支持",
      "carrier": "AT\u0026T",
      "password": "密码",
      "screen": "页面",
      "home": "主页",
      "share": "分享",
      "back": "返回",
      "install": "安装",
      "tap": "请点击",
      "public": "公开",
      "private": "加密",
      "got_it": "知道了",
      "network_error": "网络连接超时，无法保存您的操作，请检查您的网络并重新保存，取决于您的网络状况，如您上传的图片文件较大，可能需要多尝试几次。",
      "unsupported": "不支持此文件类型",
      "home_screen": "主屏幕",
      "credential_required": "此项目受密码保护，请输入你的密码凭证：",
      "state": "状态",
      "new": "新建",
      "widgets": "Widgets(1)",
      "invalid_credential": "无效的密码，请刷新后重试。",
      "app_device": "设备类型",
      "app_type": "项目类型",
      "icon": "图标",
      "splash": "启动界面",
      "size": "尺寸",
      "target": "Target",
      "png_only": "图标/启动屏幕只支持PNG文件",
      "download": "下载",
      "site_title": "墨刀",
      "wechat": "微信",
      "choose_screen": "选择要跳转的页面",
      "unsaved": "未保存",
      "timer": "定时器",
      "no_timer": "未设置",
      "type2search": "输入搜索",
      "search_doc": "搜索文档",
      "builtin": "内置",
      "width": "宽",
      "height": "高",
      "sticky": "批注",
      "auto_scale": "自动缩放",
      "embed": "嵌入",
      "app_name": "名称",
      "free_trial": "14天免费试用，查看价格",
      "restricted": "白名单",
      "private_intro": "所有知道 URL 和密码的人",
      "restricted_intro": "指定成员",
      "expired": "已过期",
      "invalid_post": "请输入内容或选择一个项目",
      "left": "左",
      "right": "右",
      "top": "上",
      "down": "下",
      "name_copy": "副本",
      "in_progress": "此操作可能需要几分钟，请您耐心等待…",
      "screen_list": "页面列表",
      "order_period": "付款时长",
      "current_plan": "当前方案",
      "next_billing_on": "当前方案到期",
      "enterprise": "企业版",
      "monthly": "月付",
      "yearly": "年付",
      "pro": "协同版",
      "free": "免费版",
      "standard": "10 人团队版",
      "startup": "5 人团队版",
      "invalid_comment": "评论内容不能为空",
      "widget_list": "组件列表",
      "edit_team": "编辑团队",
      "team": "团队",
      "role": "角色",
      "screens_count": "页面",
      "members_count": "团队成员",
      "main_state": "Main state",
      "tutorial": "教程",
      "android.customize": "自定义安卓设备",
      "transfer": "转移",
      "move": "移动",
      "name": "名称",
      "replace_image": "替换图片",
      "cancel": "取消",
      "coupon": "折扣码",
      "new_flow": "新工作流",
      "flow": "工作流",
      "ipa_device": {
        "modal_title": "IPA 文件导出",
        "add_success": "设备添加成功",
        "not_configured": "你目前尚未添加任何设备，请联系管理员到个人中心处添加或管理设备。\u003cbr\u003e\u003cbr\u003e\u003ca href=\"http://modao.cc/posts/8022\" target=\"_blank\" class=\"important\"\u003e查看 IPA 生成说明\u003c/a\u003e",
        "reach_maximum": "您帐户添加的 UDID 数量已达到上限",
        "not_valid": "无效的 UDID",
        "server_error": "服务器发生异常，请联系我们告知您的问题",
        "no_cert": "没有可用苹果开发者证书，请先联系客服进行关联",
        "not_enabled": "导出 IPA 文件需要提供有效的（个人/企业）苹果开发者证书，在生成 IPA 前，请先联系 \u003ca href=\"mailto:support@modao.cc\"\u003esupport@modao.cc\u003c/a\u003e 提供证书及相关信息。\u003cbr\u003e\u003cbr\u003e\u003ca href=\"http://modao.cc/posts/8022\" target=\"_blank\" class=\"important\"\u003e查看 IPA 生成说明\u003c/a\u003e"
      },
      "go_to_account_settings": "前往帐户设置",
      "import": "导入",
      "import_template": "导入其它项目母版",
      "choose_template_to_import": "选择要导入的母版",
      "full_view": "全局工作流",
      "expand_all": "展开所有父页",
      "apply_coupon": "应用折扣",
      "notifications": {
        "all": "通知",
        "view_all": "查看全部",
        "load_more": "加载更多",
        "request_permission": "若您要在这台电脑上使用墨刀，我们强烈建议您开启桌面通知功能。",
        "enable_notification": "开启通知功能",
        "ask_later": "下次再开启",
        "never_ask_again": "不再询问",
        "mark_all_as_read": "全部标记为已读",
        "empty": "目前还没有通知"
      },
      "loading": "正在读取",
      "buy": "购买",
      "no_post": "还没有帖子，快来创建新帖吧",
      "click2create": "点击创建",
      "login_to_vote": "请登录后点赞",
      "web_signin": "登录",
      "new_post": "新帖子",
      "choose_category": "选择分类",
      "project": "项目",
      "colon": "：",
      "open_quote": "「",
      "close_quote": "」",
      "open_inner_quote": "『",
      "close_inner_quote": "』",
      "open_parenthesis": "（",
      "close_parenthesis": "）",
      "reminder": "提示",
      "warning": "警告",
      "close": "关闭",
      "confirm": "确认",
      "done": "完成",
      "old_electron_notice_title": "客户端更新提醒",
      "old_electron_notice_desc": "您当前的客户端版本过低，可能会出现未知 bug。请到墨刀官网下载最新版客户端。",
      "or": " 或 ",
      "helpful": " 有帮助 ",
      "contact_us": "联系我们，获得帮助 ",
      "no_more": "没有更多了",
      "search_guides": "搜索教程",
      "got_message": "收到一条通知",
      "https_only": "双击编辑URL，处于安全考虑，外部网页组件仅支持https协议网站。",
      "wait_for_saving": "此页面尚未保存，请您稍后再试。",
      "dblclick_to_edit": "双击编辑母版",
      "transfer_screen": "转移页面",
      "exceed_screen_limit": "这个项目的组件及状态数量已超过 5 万，为了保证项目的打开速度，以及良好的编辑和运行时体验，您暂时不能再在此项目中添加新的页面及状态，我们建议您创建一个新的项目来完成这部分工作。",
      "data_lost_warning": "您还有数据没有保存，确定要退出吗？",
      "regenerate": "重新生成",
      "delete_projects_first": "删除团队前需要先删除所有项目。",
      "auto_scale_tip": "自动缩放以适配不同设备, 比如，勾选此选项后，为iPhone 5设计的组合在iPhone 6上将会放大1.17倍，在iPhone 6 plus上会放大1.29倍。",
      "move_tips": "创建一个副本，并移动副本到选定团队。",
      "no_joined_team": "您没有加入任何团队",
      "shell_type": "边框类型",
      "device_shell": "真实设备边框",
      "default_shell": "默认边框",
      "none_shell": "无边框",
      "default_shell_field": "边框类型",
      "highlight_clickable": "高亮链接区域",
      "sharing_password": "访问密码（可为空）",
      "load_project": "正在读取项目数据，请稍候…",
      "connect_to_push_server": "正在连接同步服务器，请确保您的网络没有屏蔽 6799 端口…",
      "unknown_error": "服务器发生未知错误，我们已经知晓此问题，并正在紧急修复中，为避免数据丢失，请您刷新此页面再进行后续操作。\u003cbr\u003e\u003cbr\u003e错误代码：%s",
      "new_version_detected": "检测到您已打开此页面\u003cspan\u003e超过 10 小时\u003c/span\u003e，目前墨刀长时间运行可能会产生一些无法预知的小问题，为了您的正常使用，请先刷新此页面，我们正在解决此问题，给您带来不便我们深感抱歉。",
      "file_too_large": "图片文件过大",
      "optimize_your_image": "为了确保图片在移动端更快加载，建议您不要上传大小超过 1MB 的图片文件，\u003cstrong\u003e如您需要上传高分辨率图片\u003c/strong\u003e，建议您先使用（\u003ca href='https://tinypng.com/' target='_blank'\u003eTinyPNG\u003c/a\u003e）或类似的服务对图片进行压缩后，再进行上传。",
      "no_app": "你还没有创建项目",
      "no_team": "您还没有团队",
      "no_team_app": "此团队还没有任何项目",
      "create_app_tips": "你可以在这里快速创建项目原型，或者通过模板创建。",
      "create_team_tips": "点击这里创建一个团队",
      "new_team": "创建团队",
      "client_download": "macOS 和 Windows 版客户端下载",
      "tutorial_video": "墨刀教程和视频",
      "created_time": "最早创建在前",
      "updated_time": "最后修改在前",
      "demo_author": "制作者",
      "my_apps": "我的项目",
      "team_apps": "我的团队",
      "forum": "讨论区",
      "all_teams": "所有团队",
      "created_teams": "我创建的团队",
      "joined_teams": "我加入的团队",
      "team_intro": "点击了解团队功能",
      "liked": "被赞",
      "karma": "Karma",
      "edit_profile": "编辑个人资料",
      "public_projects": "公开作品",
      "my_posts": "我的发表",
      "his_posts": "Ta的发表",
      "my_comments": "我的评论",
      "his_comments": "Ta的评论",
      "sharing_app": "分享原型",
      "embed_app": "嵌入代码",
      "permission": "权限",
      "access_permission": "访问权限",
      "preview_settings": "播放选项",
      "embed_tips": "通过复制下面的代码将原型插入到网站或博客中：",
      "view_in_browser": "跳过安装提示界面，直接在微信/浏览器内运行应用。",
      "functional_widgets": "功能",
      "locale_text": "EN",
      "trial_expired": "试用过期",
      "expired_on": "%s 到期",
      "upgrade": "升级",
      "renew": "续费",
      "switch_plan": "切换方案",
      "active": "有效",
      "newbie_mission": "新手任务",
      "guide": "新手教程",
      "feature_update": "功能更新",
      "my_account": "我的帐户",
      "signout": "退出登录",
      "trial": "试用",
      "personal": "个人版",
      "team20": "20 人团队版",
      "new_app": "创建项目",
      "blank_app": "空白项目",
      "use_demo": "使用模板",
      "preview_demo": "预览模板",
      "template_app": "模板项目",
      "other_settings": "其它设置",
      "all_apps": "全部项目",
      "my_active_apps": "我的项目",
      "others_apps": "的项目",
      "inbox": "移入我的项目",
      "edit_screens": "编辑项目",
      "edit_workflows": "编辑工作流",
      "view_app": "直接查看",
      "view_workflows": "查看工作流",
      "upload_artboard_first": "这是一个 Sketch 项目，请先从 Sketch 中上传至少一张图片再重试",
      "workflow_unsupport_browser": "您使用的浏览器版本目前未支持此功能。建议您下载墨刀客户端，或使用最新版本的Chrome浏览器。",
      "download_mockingbot_client": "下载墨刀客户端",
      "continue_anyway": "仍然继续",
      "icon_and_splash": "图标和启动图",
      "upload_icon": "上传新图标",
      "upload_splash": "上传新启动图",
      "make_a_copy": "创建副本",
      "more_options": "更多选项",
      "project_duplicated": "副本正在创建中，请稍候…",
      "project_duplicating": "复制中, 请稍候…",
      "project_duplicate_failed": "项目复制失败, 请重试",
      "team_name": "团队名称",
      "team_creator": "创建者",
      "me_on_team": "我的身份",
      "team_plan": "方案",
      "team_operation": "操作",
      "team_icon": "团队图标",
      "team_color": "团队颜色",
      "icon_and_color": "图标和颜色",
      "collaboration": "成员管理",
      "collaborators": "团队成员",
      "manage_collaborators": "管理成员",
      "view_collaborators": "查看成员",
      "invite": "邀请",
      "pending": "等待",
      "remove_me": "退出",
      "cant_invite_yourself": "不能邀请自己",
      "invalid_email": "无效的Email",
      "owner_only": "只有所有者或管理员可以邀请新成员",
      "already_invited": "已经邀请过了",
      "exceed_collaborator_limit": "您已超出当前计划所支持的团队成员数目，需要升级帐户。",
      "roles": {
        "admin": "管理员",
        "admin_desc": "所有权限",
        "editor": "协作者",
        "editor_desc": "修改、复制",
        "viewer": "审阅者",
        "viewer_desc": "查看、评论",
        "owner": "所有者"
      },
      "add_to": "添加至",
      "custom": "自定义",
      "custom_combo": "自定义组合",
      "create_combo": "添加到自定义组合",
      "lock_widget": "锁定",
      "unlock": "解锁",
      "widgets_here": "此处的组件",
      "widgets_selected": "选中的组件",
      "fixed_widget": "固定位置",
      "error_project": "当前项目因为数据异常无法打开, 请点击确认将其删除",
      "recover": "恢复",
      "no_deleted_screens": "回收站里空空如也",
      "transh_can": "回收站",
      "project_transh_can": "项目回收站",
      "electron_upgrading_title": "请下载最新版客户端",
      "electron_upgrading_msg": "此功能需要最新版客户端方可使用，\u003ca href='/downloads#sec-desktop' target='_blank'\u003e点击此处下载最新版客户端\u003c/a\u003e",
      "export_method": "选择导出格式",
      "download_export_file": "开始下载",
      "prepared": "准备就绪",
      "html5_zip": "HTML 压缩包 [离线]",
      "current_png": "当前页 PNG",
      "current_pngs": "全部 PNG",
      "apk_file": "安卓 APK [离线]",
      "prepare_downloading": "正在为您生成下载文件，请稍候…",
      "your_file_is_ready": "文件已开始自动下载，如果没有开始，请点击「开始下载」",
      "ipa_building_starts": "正在为您生成 iOS 应用程序，成功后会自动向您的邮箱发送包含 IPA 链接的邮件，请注意查收。",
      "no_ios_certificate": "没有可使用的苹果开发者证书，请联系墨刀客服添加证书。",
      "electron_download_alert": "点击没有反应？请先从浏览器进行下载，我们已知悉并正在解决此问题。",
      "ios_offline": "iOS IPA",
      "generate_ipa": "生成应用",
      "original_scale": "1x（原始尺寸）",
      "2x_scale": "2x（2 倍尺寸）",
      "operate": "操作",
      "save": "保存",
      "save_tip": "保存 (ctrl+S)",
      "undo": "撤销",
      "undo_tip": "撤销 (ctrl+Z)",
      "redo": "重做",
      "redo_tip": "重做 (ctrl+Y)",
      "cut": "剪切",
      "cut_tip": "剪切 (ctrl+X)",
      "copy": "复制",
      "copy_tip": "复制 (ctrl+C)",
      "paste": "粘贴",
      "paste_tip": "粘贴 (ctrl+V)",
      "paste_directly": "到原位置",
      "paste_to_point": "到当前位置",
      "send_front": "置于顶层",
      "send_back": "置于底层",
      "forward": "上移一层",
      "backward": "下移一层",
      "link_line": "链接",
      "grid": "格线",
      "ruler": "量尺",
      "lock": "锁定",
      "export": "导出",
      "rotate": "旋转",
      "layout": "图层",
      "assets": "图片库",
      "align": "对齐",
      "hleft": "左对齐",
      "hleft_tip": "左对齐 (ctrl+alt+L)",
      "hcenter": "水平居中",
      "hcenter_tip": "水平居中 (ctrl+alt+C)",
      "hright": "右对齐",
      "hright_tip": "右对齐 (ctrl+alt+R)",
      "vtop": "顶对齐",
      "vtop_tip": "顶对齐 (ctrl+alt+T)",
      "vcenter": "垂直居中",
      "vcenter_tip": "垂直居中 (ctrl+alt+V)",
      "vbottom": "底对齐",
      "vbottom_tip": "底对齐 (ctrl+alt+B)",
      "distribute": "分布",
      "hdistribute_tip": "水平等间距 (ctrl+shift+H)",
      "vdistribute_tip": "垂直等间距 (ctrl+shift+U)",
      "group": "组合",
      "group_tip": "组合 (ctrl+G)",
      "ungroup": "打散",
      "ungroup_tip": "打散 (ctrl+U)",
      "landscape": "横屏",
      "portrait": "竖屏",
      "zoomin": "放大",
      "zoomout": "缩小",
      "launch": "运行",
      "hide": "隐藏",
      "font_size": "字号",
      "bold": "加粗",
      "italic": "斜体",
      "underline": "下划线",
      "line_through": "中线",
      "text_color": "文字颜色",
      "h_align": "水平对齐",
      "v_align": "垂直对齐",
      "color": "颜色",
      "widget": "组件",
      "master": "母版",
      "combo": "组合",
      "search_icon": "搜索图标",
      "search_master": "搜索母版",
      "search_combo": "搜索组合",
      "beginner_guide": "新手引导",
      "shortcuts": "快捷键",
      "cant_delete_template": "无法删除此母版，请先删除此母版的所有实例。",
      "watch_tutorial": "观看教学视频",
      "drag_widgets_2create": "拖拽组件创建组合",
      "expand": "展开",
      "fold": "收起",
      "device_libraries": "平台组件",
      "combos": {
        "ios": {
          "navigation_bar": "顶栏",
          "navbar_with_icons": "图标导航栏",
          "navbar_with_subtitle": "文本导航栏",
          "tabs_4": "标签栏-4",
          "tabs_5": "标签栏-5",
          "safari": "地址栏",
          "search_bar": "搜索栏",
          "status_bar": "状态栏",
          "segmented_control_2": "分段控件-2",
          "segmented_control_3": "分段控件-3",
          "mcheckbox2": "多选",
          "switch": "开关",
          "slider": "滑块",
          "list_with_value": "标准列表",
          "list_with_thumb": "缩略图列表",
          "control_popover": "弹出气泡",
          "message": "消息列表",
          "alert": "弹窗",
          "prompt": "密码弹窗",
          "vertical_alert": "垂直按钮弹窗",
          "action_sheet": "底部弹窗",
          "quick_actions": "快捷菜单",
          "notification": "消息通知",
          "widget_base": "通知",
          "keyboard": "键盘"
        },
        "android": {
          "app_bar": "顶部导航",
          "app_bar_2": "顶部导航2",
          "navbar": "底部导航",
          "status_bar": "状态栏",
          "search": "搜索栏",
          "button": "按钮",
          "mcheckbox2": "多选",
          "mradiobutton": "单选",
          "slider": "滑块",
          "fab": "悬浮按钮",
          "menu": "菜单",
          "list": "列表",
          "list_with_icons": "多行文本列表",
          "dialog": "对话框",
          "dialog_with_title": "标题对话框",
          "list_sheet": "列表菜单",
          "grid_sheet": "底部弹窗",
          "notification": "消息通知",
          "interactive_notification": "通知弹窗",
          "keyboard": "键盘"
        }
      },
      "no_icons": "没有符合条件的图标",
      "no_result_found": "未找到相关内容",
      "icons": {
        "recent": "最近",
        "all": "全部",
        "web_app": "Web App",
        "medical": "医疗",
        "text_editor": "文字编辑",
        "spinner": "旋转",
        "file_type": "文件类型",
        "directional": "方向",
        "video_player": "播放器",
        "form_control": "表单",
        "transportation": "交通",
        "chart": "图表",
        "brand": "Logo",
        "hand": "手势",
        "payment": "支付",
        "currency": "货币",
        "accessibility": "无障碍",
        "gender": "性別",
        "av": "音视频",
        "action": "动作",
        "alert": "告警",
        "communication": "沟通",
        "content": "编辑",
        "device": "设备",
        "editor": "文字编辑",
        "file": "文件",
        "handware": "硬件",
        "image": "影像",
        "maps": "地图",
        "navi": "导览",
        "notif": "通知",
        "places": "地点",
        "social": "社交",
        "toggle": "切换",
        "widgets": "组件",
        "tool": "工具",
        "miscellaneous": "其他"
      },
      "w": {
        "label": "文字",
        "text_view": "多行文字",
        "icon_button": "图标",
        "image_view": "图片",
        "button": "按钮",
        "mtooltip": "聊天气泡",
        "webpage": "网页",
        "pg": "全局手势",
        "lr": "链接区域",
        "sticky": "批注",
        "rounded_rect": "矩形",
        "circle_rect": "圆形",
        "hr": "线条",
        "ve": "线条",
        "triangleb": "三角",
        "triangletl": "三角",
        "mtext_input": "单行输入",
        "mtextarea": "多行输入",
        "mcheckbox2": "复选框",
        "mradiobutton": "单选框",
        "mselect": "下拉框",
        "mfile_input": "选择文件",
        "switch": "开关按钮",
        "navigation_bar": "标题栏",
        "tab_bar": "底栏",
        "rectangle": "空白通栏",
        "search_bar": "搜索框",
        "tab_item": "标签",
        "map_view": "地图",
        "keyboard": "键盘",
        "status_bar": "状态栏",
        "panel": "母版实例",
        "group": "群组",
        "navbar_title": "标题",
        "search": "搜索",
        "return": "换行",
        "carrier": "中国移动",
        "text_view_placeholder": "如果你无法简洁的表达你的想法，那只说明你还不够了解它。\n  -- 阿尔伯特·爱因斯坦"
      },
      "link_back": "返回上一页",
      "click_to_origin": "点我回原点",
      "last_saved": "最后保存",
      "all_saved": "全部操作已保存",
      "link_to_prev": "返回上一页",
      "screen_bgcolor": "设置背景色",
      "screen_bgimage": "设置背景图片",
      "drag_to_resize": "拖动调节页面高度",
      "drag_to_link_screen": "拖动圆圈到右侧目标页面创建交互",
      "drag_to_create_screen": "拖拽图片创建新页",
      "whats_this": "这是什么？",
      "slider_desc": "你可以通过页面设计器旁边的这两个滑块来控制页面「顶栏」和「底栏」的高度，「顶栏」和「底栏」内的组件/图片在页面切换时将不会随整个页面一起移动。",
      "link_back_desc": "返回上一页：拖动组件的链接按钮到此处可以创建返回链接，运行状态下，点击返回链接将返回到当前页面的上一页。",
      "select_panel_states": "选择一个状态创建母版链接",
      "state_link_tutorial": "观看母版链接教学视频",
      "new_state": "新状态",
      "global_state": "全局状态",
      "default_state": "默认状态",
      "global_state_link_error": "全局状态不允许创建状态链接",
      "panel_state_link_error": "母版内元素不允许创建状态链接",
      "new_screen": "新页面",
      "not_support_level_5": "不支持五级页面",
      "remove_parent_only": "只删除父页面",
      "remove_all": "删除父页面及所有子页面",
      "cant_remove_screen": "您的项目需要至少一个页面。",
      "screen_trash_can": "页面回收站",
      "component": "元素",
      "main_panel": "设置",
      "menu_offset": "菜单偏移%",
      "reset_target_screen": "重置目标页为初始状态",
      "images": "图片",
      "hidden": "隐藏 (V)",
      "locked": "锁定 (L)",
      "fill": "填充",
      "icon_color": "图标色",
      "stroke": "描边",
      "stroke_color": "描边色",
      "fg_color": "前景色",
      "bg_color": "背景色",
      "border": "边框",
      "border_style": "边框类型",
      "border_color": "边框颜色",
      "border_width": "线宽",
      "shadow": "投影",
      "shadow_color": "阴影颜色",
      "drop_shadow": "边框阴影",
      "text_shadow": "文字阴影",
      "input_types": {
        "text": "文字",
        "number": "数字",
        "search": "搜索",
        "password": "密码",
        "date": "日期",
        "time": "时间",
        "datetime": "日期时间"
      },
      "inspector": {
        "position": "外观",
        "rotate": "旋转",
        "radius": "圆角",
        "is": "图标大小",
        "o": "不透明度",
        "input_type": "键盘样式",
        "circularize": "一键圆形",
        "squareize": "一键正方形",
        "checked": "是否勾选",
        "fixed": "运行时固定位置",
        "not_fixed": "不固定",
        "fixed_auto": "自动检测固定方向",
        "fixed_top": "相对顶部固定",
        "fixed_bottom": "相对底部固定",
        "main_state": "默认状态",
        "text": "文本",
        "line_height": "行高",
        "padding": "间距",
        "image": "图片",
        "p": "等比缩放图片",
        "drag_image_here": "将图片拖到这里或者点击",
        "upload_image": "上传",
        "manage_image": "管理图片",
        "reset": "重置",
        "clip": "剪贴蒙版",
        "filter": "滤镜",
        "blur": "模糊",
        "grayscale": "灰度",
        "sepia": "加温",
        "brightness": "亮度",
        "contrast": "对比度",
        "hue_rotate": "色相",
        "invert": "反色",
        "saturate": "饱和度",
        "state": "动效",
        "show_case": "效果展示",
        "animation": "动效",
        "ani_delay": "延时",
        "ani_duration": "动效时长",
        "ani_count": "重复次数",
        "kbd_style": "键盘样式",
        "text_kbd": "文本",
        "numeric_kbd": "数字",
        "tt_placement": "箭头方向",
        "tt_offset": "箭头偏移",
        "tt_arrow_size": "箭头大小"
      },
      "ani": {
        "none": "无",
        "attention_seekers": "引起注意",
        "bouncing_entrances": "弹入",
        "flippers": "翻转",
        "rotating_entrances": "旋转",
        "sliding_entrances": "滑入",
        "zoom_entrances": "缩放",
        "specials": "其它",
        "bounce": "弹跳",
        "fadeIn": "渐现",
        "fadeOut": "渐出",
        "flash": "闪烁",
        "pulse": "跳动",
        "rubberBand": "橡皮筋",
        "shake": "抖动",
        "swing": "摆动",
        "tada": "哒啷",
        "wobble": "摇晃",
        "jello": "扭曲抖动",
        "bounceIn": "弹入",
        "bounceInDown": "上弹入",
        "bounceInLeft": "左弹入",
        "bounceInRight": "右弹入",
        "bounceInUp": "下弹入",
        "flipInX": "水平翻转",
        "flipInY": "垂直翻转",
        "spinning": "旋转（顺时针）",
        "spinning-reverse": "旋转（逆时针）",
        "rotateIn": "旋入",
        "rotateInDownLeft": "左下旋转",
        "rotateInDownRight": "右下旋转",
        "rotateInUpLeft": "左上旋转",
        "rotateInUpRight": "右上旋转",
        "slideInDown": "上滑入",
        "slideInLeft": "左滑入",
        "slideInRight": "右滑入",
        "slideInUp": "下滑入",
        "zoomIn": "逐渐放大",
        "zoomInDown": "从下放大",
        "zoomInLeft": "从左放大",
        "zoomInRight": "从右放大",
        "zoomInUp": "从上放大",
        "rollIn": "滚入",
        "lightSpeedIn": "闪入"
      },
      "link_settings": "设置手势和转场",
      "tr": {
        "none": "默认",
        "slideleft": "右移入",
        "slideright": "左移入",
        "slidebottom": "下移入",
        "slidetop": "上移入",
        "leftmenu": "左菜单",
        "rightmenu": "右菜单",
        "leftdrawer": "左抽屉",
        "rightdrawer": "右抽屉",
        "slideleft2": "左弹入",
        "slideright2": "右弹入",
        "topin": "上弹入",
        "popin": "下弹入",
        "leftout": "左弹出",
        "rightout": "右弹出",
        "topout": "上弹出",
        "popout": "下弹出"
      },
      "g": {
        "tap": "单击",
        "left": "左滑",
        "right": "右滑",
        "up": "上滑",
        "down": "下滑",
        "hold": "长按",
        "dtap": "双击",
        "shake": "摇一摇",
        "timer": "定时器",
        "vscroll": "垂直滚动"
      },
      "animate": "动起来",
      "ani_name": "动效",
      "ani_delay": "延迟",
      "ani_duration": "动效时长",
      "ani_count": "重复次数",
      "none": "无",
      "default": "默认",
      "infinite": "无限循环",
      "asset_search": "输入图片名称",
      "all_assets": "全部图片",
      "my_assets": "我的图片",
      "current_project": "当前项目",
      "my_project": "我的项目",
      "created_project": "创建项目",
      "archived_project": "归档项目",
      "collaborate_project": "协作项目",
      "team_project": "团队项目",
      "tags": "标签",
      "tag_name": "标签名称",
      "manage": "管理",
      "finish": "完成",
      "create_tag": "创建新标签",
      "type_tag_name": "输入标签名称",
      "tags_placeholder": "选择一个图片添加标签",
      "no_selected": "未选择图片",
      "no_assets": "没有找到您要的素材, 请点击右下角上传",
      "insert_to_current": "插入当前页",
      "insert_succeeded": "插入成功",
      "drag_image_here": "将图片拖到这里或",
      "upload": "上传",
      "storage": "存储",
      "default_color": "默认颜色",
      "history_color": "最近使用颜色",
      "prev_step": "上一步",
      "next_step": "下一步",
      "step_1_title": "控件区",
      "step_1_desc": "\u003cb\u003e拖拽\u003c/b\u003e常用组件、多套图标库、自定义组合、动态母版到画布中，\u003cb\u003e快速\u003c/b\u003e进行界面设计。",
      "step_2_title": "设计区",
      "step_2_desc": "此处为主要的设计区域。将控件全部拖入中间的设备框中，通过设置控件位置、外观，来完成界面设计。",
      "step_3_title": "列表区",
      "step_3_desc": "包含页面列表、页面状态列表、页面控件列表。在此处创建多级页面结构。将控件\u003cb\u003e链接\u003c/b\u003e至列表的具体页面，可添加页面交互效果。",
      "step_4_title": "工具栏",
      "step_4_desc": "主工具栏可以对组件或者画布进行常规调整。副工具栏包含常用组件设置功能，可对文本相关控件进行排版和外观设置。",
      "step_5_title": "运行",
      "step_5_desc": "点击运行，可模拟真机演示效果；分享二维码，协同查看及时获取他人反馈；开发者模式，可一键获取标注参数。",
      "step_6_title": "回收站",
      "step_6_desc": "也叫做页面回收站。可以在这里一键恢复误删的页面。",
      "step_7_title": "教程",
      "step_7_desc": "需要帮助？来这看看官方教程吧，解决你的所有疑问！",
      "preview": {
        "powered_by_modao": "使用墨刀制作",
        "comment": {
          "switch": "评论模式",
          "tip": "双击预览区域添加新评论",
          "tip_signin": "登录以添加新评论",
          "tip_not_collaborator": "当前登录帐号不在协作名单中，请联系项目所有者获取权限，参与讨论",
          "panel": " 条评论",
          "thread_create": "评论",
          "thread_delete_confirm": "永久删除本组评论？",
          "thread_none": "无评论",
          "thread_none_tip": "点击底部按钮或双击预览区添加新评论",
          "thread_none_tip_signin": "使用下方按钮登录以添加新评论",
          "comment_placeholder": "使用 Shift + Enter 换行",
          "comment_create": "回复",
          "comment_create_initial": "创建",
          "comment_create_initial_title": "创建评论",
          "comment_delete_confirm": "永久删除本条回复？",
          "modify_edit": "编辑",
          "modify_delete": "删除",
          "reply": " 条回复",
          "reply_none": "无回复",
          "reply_none_tip": "请在下方添加评论内容以创建评论",
          "reply_new": " 未读",
          "reply_new_thread": "新",
          "divider_new": "新回复",
          "show_all_0": "展开",
          "show_all_1": " 条回复",
          "tag_edited": "修改",
          "unfold": "展开"
        },
        "screen": {
          "panel": "页面",
          "total_page": "页面总数"
        }
      },
      "preview_panel": {
        "comment": "评论",
        "thread_sum": "评论总数",
        "developer_mode": "开发者模式",
        "opacity": "不透明度",
        "text": "文字",
        "typeface": "字型",
        "font_size": "字号",
        "offset": "起始",
        "length": "长度",
        "Fills": "填充色",
        "fills": "填充色",
        "width": "宽",
        "height": "高",
        "borders": "边框",
        "thickness": "宽度",
        "color": "颜色",
        "position": "位置",
        "bd_radius": "圆角宽度",
        "align": "对齐方式",
        "line_height": "行高",
        "copied": "已复制！",
        "asset": "素材下载",
        "asset_zip": "3 位图ZIP文件",
        "asset_pdf": "1 矢量文件"
      },
      "email_placeholder": "点击输入邮箱",
      "no_search_result": "没有相应的搜索结果",
      "check_pricing": "查看付费方案",
      "renew_prompt": {
        "title": "付费功能提示",
        "user_plan": "您的帐户方案为{plan}，",
        "user_expired": "您的帐户已过期，",
        "project_plan": "此项目所属帐户方案为{plan}，",
        "project_expired": "此项目所属帐户已过期，",
        "team_plan": "此团队所属帐户方案为{plan}，",
        "team_expired": "此团队所属帐户已过期，",
        "user_upgrade": "升级方案解除此限制。",
        "project_upgrade": "请联系项目所有者升级方案解除此限制。",
        "team_upgrade": "请联系团队所有者升级方案解除此限制。",
        "user_renew": "续费方案解除此限制。",
        "project_renew": "请联系项目所有者续费方案解除此限制。",
        "team_renew": "请联系团队所有者续费方案解除此限制。",
        "user_projects": "最多允许创建 3 个项目，",
        "new_team_project": "无法新建团队项目，",
        "dup_team_project": "无法复制团队项目，",
        "new_team": "不支持创建团队，",
        "storage": "包含存储容量{storage}，",
        "screens": "每个项目最多可创建 20 个页面，",
        "exportable": "不支持导出 {format} 格式，",
        "inspectable": "不支持开启开发者模式，",
        "slices": "不支持切片下载，",
        "collaboration": "您无法继续编辑此项目，",
        "collaborators": "最多支持邀请 {collaborators} 个协作者，",
        "cant_invite": "不支持添加协作者，",
        "cant_move": "无法转移项目到此团队，",
        "cant_comment": "不支持评论功能，"
      },
      "error_happened": "出错了",
      "font_size_issue": "我们发现您正在使用 Chrome 浏览器，要显示小于 12 像素的文字，您需要先修改 Chrome 的默认最小字体大小设置，",
      "know_how": "了解方法",
      "gesture_conflict": "检测到手势冲突！",
      "vertical_conflict": "上下滑动手势与页面垂直滚动有冲突，启用上下滑动手势将会禁用当前页面的垂直滚动。",
      "horizontal_conflict": "左右滑动手势与母版水平滚动有冲突，启用左右滑动手势将会禁用母版的水平滚动。",
      "global_state_alert": "\u003cp class=\"desc\"\u003e当前页面有不止 1 个页面状态，请切换到全局状态（状态 0）添加新组件。\u003c/p\u003e \u003cp class=\"desc\"\u003e\u003cstrong\u003e注意：\u003c/strong\u003e在全局状态中的操作将会同步到所有其他状态。\u003c/p\u003e \u003cp class=\"desc\" style=\"margin: 2em 0 -1em; text-align: center;\"\u003e\u003cimg src=\"images/workspace/global_state_zh-CN.png\" width=\"111\"\u003e\u003c/p\u003e\n",
      "del_app_title": "删除项目",
      "del_app_desc": "\u003cp class=\"desc\"\u003e您确定要删除项目\u003cspan class=\"quote\"\u003e\u003cspan class=\"project-name\"\u003e%s\u003c/span\u003e\u003c/span\u003e吗？ \u003cp class=\"desc tertiary\"\u003e\n  项目删除 2 周内，可在页面右下方的\n  \u003cspan class=\"recycle\"\u003e\n    \u003cspan class=\"icon-recycle\"\u003e\u003c/span\u003e\n    回收站\n  \u003c/span\u003e\u0026nbsp;恢复\n",
      "exit_app_title": "退出项目",
      "exit_app_desc": "您确定要退出项目\u003cspan class=\"quote\"\u003e\u003cspan class=\"project-name\"\u003e%s\u003c/span\u003e\u003c/span\u003e吗？",
      "dup_app_title": "复制项目",
      "dup_app_desc": "您确定要复制项目\u003cspan class=\"quote\"\u003e\u003cspan class=\"project-name\"\u003e%s\u003c/span\u003e\u003c/span\u003e吗？",
      "move_app_title": "移动项目",
      "move_app_desc": "移动项目\u003cspan class=\"quote\"\u003e\u003cspan class=\"project-name\"\u003e%s\u003c/span\u003e\u003c/span\u003e到其他位置。",
      "del_team_title": "删除团队",
      "del_team_desc": "您确定要删除团队\u003cspan class=\"quote\"\u003e\u003cspan class=\"team-name\"\u003e%s\u003c/span\u003e\u003c/span\u003e吗？",
      "del_collaborator_title": "删除团队成员",
      "del_collaborator_desc": "您确定要删除团队成员\u003cspan class=\"quote\"\u003e\u003cspan class=\"user-name\"\u003e%s\u003c/span\u003e\u003c/span\u003e吗？",
      "exit_team_title": "退出团队",
      "exit_team_desc": "您确定要退出团队\u003cspan class=\"quote\"\u003e\u003cspan class=\"team-name\"\u003e%s\u003c/span\u003e\u003c/span\u003e吗？",
      "del_screen_title": "删除页面",
      "del_screen_desc": "您确定要删除页面\u003cspan class=\"quote\"\u003e\u003cspan class=\"widget-name\"\u003e%s\u003c/span\u003e\u003c/span\u003e吗？",
      "del_parental_screen_desc": "\u003cspan class=\"quote\"\u003e\u003cspan class=\"widget-name\"\u003e%name\u003c/span\u003e\u003c/span\u003e有 \u003cb\u003e%count 个子页面\u003c/b\u003e，您要？",
      "dup_screen_title": "复制页面",
      "dup_parental_screen_desc": "\u003cspan class=\"quote\"\u003e\u003cspan class=\"widget-name\"\u003e%name\u003c/span\u003e\u003c/span\u003e有 \u003cb\u003e%count 个子页面\u003c/b\u003e，您要？",
      "del_master_title": "删除母版",
      "del_master_desc": "您确定要删除母版\u003cspan class=\"quote\"\u003e\u003cspan class=\"widget-name\"\u003e%s\u003c/span\u003e\u003c/span\u003e吗？",
      "dup_master_title": "复制母版",
      "dup_master_desc": "您确定要复制母版\u003cspan class=\"quote\"\u003e\u003cspan class=\"widget-name\"\u003e%s\u003c/span\u003e\u003c/span\u003e吗？",
      "del_combo_title": "删除组合",
      "del_combo_desc": "您确定要删除组合\u003cspan class=\"quote\"\u003e\u003cspan class=\"widget-name\"\u003e%s\u003c/span\u003e\u003c/span\u003e吗？",
      "dup_combo_title": "复制组合",
      "dup_combo_desc": "您确定要复制组合\u003cspan class=\"quote\"\u003e\u003cspan class=\"widget-name\"\u003e%s\u003c/span\u003e\u003c/span\u003e吗？",
      "unsaved_title": "退出%type",
      "unsaved_desc": "%type\u003cspan class=\"quote\"\u003e\u003cspan class=\"project-name\"\u003e%name\u003c/span\u003e\u003c/span\u003e还有更新尚未保存，您确定要退出吗？",
      "unsaved_confirm": "保存并退出",
      "transfer_screen_title": "转移页面",
      "transfer_screen_desc": "转移页面\u003cspan class=\"quote\"\u003e\u003cspan class=\"widget-name\"\u003e%s\u003c/span\u003e\u003c/span\u003e到其他位置。",
      "export_unsaved_title": "项目尚未保存",
      "export_unsaved_desc": "项目\u003cspan class=\"quote\"\u003e\u003cspan class=\"project-name\"\u003e%name\u003c/span\u003e\u003c/span\u003e还有更新尚未保存，请等待保存完成后再次点击导出。",
      "export_unsaved_confirm": "保存并导出",
      "regenerate_url_title": "重置分享链接",
      "regenerate_url_desc": "此操作将会重新生成分享 URL，旧的 URL 将无法再访问此项目，确定要重新生成吗？",
      "account": {
        "pay_success": "支付成功",
        "reload_after_countdown": "%s 秒后自动跳转",
        "switch_plan": "查看方案",
        "renew": "续费",
        "scan_with_wechat": "使用微信扫一扫付款",
        "provided_by_pingxx": "本支付服务由 Ping++ 提供",
        "reload": "立即刷新",
        "save_17": "节省17%",
        "new_plan": "新方案名称",
        "new_billing_date": "新续费日",
        "wechat_pay": "微信支付",
        "confirm_pay": "确认支付",
        "pay": "支付",
        "discount": "当前折扣",
        "account": "开通帐号",
        "plan": "方案名称",
        "period": "方案时长",
        "price": "方案价格",
        "balance_left": "原方案剩余时长抵现",
        "next_billing_on": "到期时间",
        "new_next_billing_on": "新方案到期时间",
        "amount": "金额",
        "order_period": "付款时长",
        "payment_gateway": "支付网关",
        "billing_date": "日期",
        "receipt": "收据",
        "receipt_details": "收据详情",
        "company_name": "公司名称",
        "vat_id": "税号",
        "address": "地址",
        "receipt_confirmation": "请您务必核对信息填写是否正确",
        "receipt_success": "收据创建成功",
        "receipt_download": "下载",
        "receipt_submit": "确定",
        "coupon_code": "应用折扣",
        "use": "使用",
        "used_discount": "已使用 %off 折优惠码",
        "used_discount_saving": "已使用 %off 折优惠码，立省 %saving",
        "payment_methods": "支付方式",
        "actual_payment": "实际支付",
        "switch_new_plan": "切换新方案",
        "submit": "提交订单",
        "having_problem_title": "付款遇到问题？",
        "having_problem_desc": "如您付款遇到问题，可发 Email 至 support@mockingbot.com 获取支持，如您使用的是墨刀桌面客户端，可尝试切换到桌面浏览器进行支付。",
        "finished": "已完成支付",
        "payment_error": "支付过程出现问题",
        "no_team": "暂无团队"
      }
    };
  
  }).call(this);
</script>

<link rel="stylesheet" media="screen" href="webpack/font-icons-27a1563c3bd8828d20b826fd919bf3ac.css" />
<link href='css/roboto.css' media='screen' rel='stylesheet'>

<link rel="stylesheet" media="screen" href="assets/sharing-8bc0ac22a9b752132332ea0111f37f51.css" />
<link rel="stylesheet" media="screen" href="webpack/lib-preview-943bb8dbdd4d5e21721d93079a478c07.css" />
<link rel="stylesheet" media="screen" href="webpack/preview-9bcacd88ba95d619b2086c8ccc84149e.css" />
<script>
  var webpackManifest = {"0":"vendor.js","1":"workspace.js","2":"lib-preview.js","3":"account.js","4":"landing.js","5":"projectflow.js","6":"notifications.js","7":"forum.js","8":"dashboards.js","9":"snapshot.js","10":"guides.js","11":"vendor-jquery.js","12":"constant.js","13":"faq.js","14":"preview.js","15":"font-icons.js","16":"landing-for-app.js"}
  var MBServer = 'modao.cc'
  document.getElementsByClassName('indicator')[0].style.height = '30%'
</script>
<script src="webpack/manifest-2675e13b81d19625e58a.js"></script>
<script src="webpack/vendor-jquery-b53596c4bdae5f91cafe.js"></script>
<script src="webpack/vendor-96a311c34d761715b481.js"></script>
<script src="assets/sharing-74d8a06727840b2dd083355c04e82a8b.js"></script>
<script src="webpack/lib-preview-f3dc8817b9f07cf07b7a.js"></script>
<script src="webpack/preview-ee3f5b5f1074fbee100a.js"></script>
<script>
  $(function () {
    if (MB.isMobile()) {
      $('body').addClass('mobile')
      MB.mp('在移动端打开了应用')
      MB.ga('send', 'event', 'goal', '在移动端打开了应用')
    }
  
    if (!window.navigator.standalone && !false && MB.isMobile() && !window.MBData) MB.initInstall()
    else MB.load('6MrVIo1xU64YPOrWi64U3PCZ77GOJCh', false, '')
  })
</script>

</body>
</html>
<script>window.MBData=
{"templates":[],"project":{"owner_id":645254,"owner_plan":"pro","owner_name":"楊涵","owner_email":"1701210821@pku.edu.cn","owner_paid":false,"owner_period":null,"owner_avatar":"/images/avatar.png","owner_expired_on":"2017-12-01","limitation":{"collaborators":1,"storage":20000,"exportable":["png","pngs","htmlzip","apk"],"encryptable":true,"inspectable":true,"slices":true,"projects":6553500,"screens":6553500,"commentable":true},"channels":["1701210821pkueducn645254"],"screens_count":7,"cid":"p0D48EC8B5A1510816349716","team_cid":null,"name":"教師排課系統","updated_at":"2017-11-28T18:39:38+08:00","created_at":"2017-11-16T15:15:05+08:00","access":"private","access_token":"6MrVIo1xU64YPOrWi64U3PCZ77GOJCh","version":"v2","icon":"/images/icon_retina.png","splash":null,"width":800,"height":600,"device":"web","model":"desktop","scale":100,"archived":false,"template":false,"timestamp":"1511865578","combo":false,"behavior":"inherit","master":false,"builtin":false,"auto_scale":false,"parent_cid":null,"host_cid":null,"clones":0,"shell_type":"none","password":"","wechat":false,"highlight":true,"expired":false,"validated":false,"duplicating":false,"slack_web_hook_url":null},"screens":[{"cid":"sB88A4762131510816505717","project_cid":"p0D48EC8B5A1510816349716","parent_cid":null,"expanded":false,"name":"登入介面","orientation":"portrait","position":2,"width":800,"height":600,"hh":null,"fh":null,"bgcolor":"#FFFFFF","bgimage":null,"deleter_name":null,"deleted_at":null,"artboard_id":null,"artboard_asset_id":null},{"cid":"s19016892F01510838050124","project_cid":"p0D48EC8B5A1510816349716","parent_cid":null,"expanded":false,"name":"教師專區 ","orientation":"portrait","position":2,"width":800,"height":600,"hh":null,"fh":null,"bgcolor":"#FFFFFF","bgimage":null,"deleter_name":null,"deleted_at":null,"artboard_id":null,"artboard_asset_id":null},{"cid":"sA8DBD9D2741510838310816","project_cid":"p0D48EC8B5A1510816349716","parent_cid":null,"expanded":false,"name":"管理員端口","orientation":"portrait","position":2,"width":800,"height":600,"hh":null,"fh":null,"bgcolor":"#FFFFFF","bgimage":null,"deleter_name":null,"deleted_at":null,"artboard_id":null,"artboard_asset_id":null},{"cid":"sF90675E0161510839213382","project_cid":"p0D48EC8B5A1510816349716","parent_cid":null,"expanded":false,"name":"學生專區  ","orientation":"portrait","position":2,"width":800,"height":600,"hh":null,"fh":null,"bgcolor":"#FFFFFF","bgimage":null,"deleter_name":null,"deleted_at":null,"artboard_id":null,"artboard_asset_id":null},{"cid":"s795AB88C291510840500648","project_cid":"p0D48EC8B5A1510816349716","parent_cid":null,"expanded":false,"name":"評價與回饋","orientation":"portrait","position":3,"width":800,"height":600,"hh":null,"fh":null,"bgcolor":"#FFFFFF","bgimage":null,"deleter_name":null,"deleted_at":null,"artboard_id":null,"artboard_asset_id":null},{"cid":"s4839A219651510841695782","project_cid":"p0D48EC8B5A1510816349716","parent_cid":null,"expanded":false,"name":"基本資料","orientation":"portrait","position":4,"width":800,"height":600,"hh":null,"fh":null,"bgcolor":"#FFFFFF","bgimage":null,"deleter_name":null,"deleted_at":null,"artboard_id":null,"artboard_asset_id":null},{"cid":"s6E2C4802491510894438885","project_cid":"p0D48EC8B5A1510816349716","parent_cid":null,"expanded":false,"name":"我的檔案","orientation":"portrait","position":4,"width":800,"height":600,"hh":null,"fh":null,"bgcolor":"#FFFFFF","bgimage":null,"deleter_name":null,"deleted_at":null,"artboard_id":null,"artboard_asset_id":null}],"widgets":[{"cid":"wB830FB0D241510900519752","screen_cid":"sB88A4762131510816505717","timestamp":28539893,"v":true,"name":"pg","left":-40.0,"top":211.0,"width":40.0,"height":40.0,"gid":null,"locked":false,"icon":"tap"},{"cid":"wFA99AD45E01510900578932","screen_cid":"sB88A4762131510816505717","timestamp":28539898,"v":true,"name":"circle_rect","left":160.0,"top":50.0,"width":560.0,"height":505.0,"gid":null,"locked":false,"text":"\u003cp\u003e \u003c/p\u003e","fs":14,"bs":1,"ha":"center","va":"middle","z":7,"lh":20,"th":"","td":"normal","bo":0,"i":0,"bg":"#b0e8e1","bc":"","tc":"","o":100,"ts":0,"tsc":"#aaaaaa","ds":0,"sc":"#aaaaaa","ro":0,"padding":0,"ls":0,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"wB5480356361510900612891","screen_cid":"sB88A4762131510816505717","timestamp":28539902,"v":true,"name":"label","left":384.0,"top":112.0,"width":113.0,"height":23.0,"gid":null,"locked":false,"text":"\u003cp\u003e威德国际语言学校\u003c/p\u003e","fs":14,"br":0,"bs":0,"ha":"center","va":"middle","z":7,"th":"","lh":20,"td":"normal","bo":0,"i":0,"bg":"","bc":"","tc":"","o":100,"ts":0,"tsc":"#aaaaaa","ds":0,"sc":"#aaaaaa","ro":0,"padding":0,"ls":0,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"w2A13E1E8C91510900766429","screen_cid":"sB88A4762131510816505717","timestamp":28539908,"v":true,"name":"label","left":244.0,"top":199.0,"width":101.0,"height":23.0,"gid":null,"locked":false,"text":"\u003cp\u003e学员/教师 编号 :\u003c/p\u003e","fs":14,"br":0,"bs":0,"ha":"center","va":"middle","z":7,"th":"","lh":20,"td":"normal","bo":0,"i":0,"bg":"","bc":"","tc":"","o":100,"ts":0,"tsc":"#aaaaaa","ds":0,"sc":"#aaaaaa","ro":0,"padding":0,"ls":0,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"w8EDD23347E1510900769173","screen_cid":"sB88A4762131510816505717","timestamp":28539911,"v":true,"name":"label","left":280.0,"top":264.0,"width":65.0,"height":23.0,"gid":null,"locked":false,"text":"\u003cp\u003e个人密码 :\u003c/p\u003e\u003cp\u003e\u003cbr\u003e\u003c/p\u003e","fs":14,"br":0,"bs":0,"ha":"center","va":"middle","z":7,"th":"","lh":20,"td":"normal","bo":0,"i":0,"bg":"","bc":"","tc":"","o":100,"ts":0,"tsc":"#aaaaaa","ds":0,"sc":"#aaaaaa","ro":0,"padding":0,"ls":0,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"w255F8F0A231510900771890","screen_cid":"sB88A4762131510816505717","timestamp":28539914,"v":true,"name":"label","left":280.0,"top":335.0,"width":65.0,"height":23.0,"gid":null,"locked":false,"text":"\u003cp\u003e验证号码 :\u003c/p\u003e\u003cp\u003e\u003cbr\u003e\u003c/p\u003e","fs":14,"br":0,"bs":0,"ha":"center","va":"middle","z":7,"th":"","lh":20,"td":"normal","bo":0,"i":0,"bg":"","bc":"","tc":"","o":100,"ts":0,"tsc":"#aaaaaa","ds":0,"sc":"#aaaaaa","ro":0,"padding":0,"ls":0,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"wB0AC0823211510900776447","screen_cid":"sB88A4762131510816505717","timestamp":28539917,"v":true,"name":"label","left":255.5,"top":394.0,"width":64.0,"height":23.0,"gid":null,"locked":false,"text":"\u003cp\u003e[忘记密码]\u003c/p\u003e","fs":14,"br":0,"bs":0,"ha":"center","va":"middle","z":7,"th":"","lh":20,"td":"normal","bo":0,"i":0,"bg":"","bc":"","tc":"","o":100,"ts":0,"tsc":"#aaaaaa","ds":0,"sc":"#aaaaaa","ro":0,"padding":0,"ls":0,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"w345BC2ABE91510900835537","screen_cid":"sB88A4762131510816505717","timestamp":28539928,"v":true,"name":"label","left":370.0,"top":394.0,"width":85.0,"height":23.0,"gid":null,"locked":false,"text":"\u003cp\u003e记住学籍编号\u003c/p\u003e\u003cp\u003e\u003cbr\u003e\u003c/p\u003e","fs":14,"br":0,"bs":0,"ha":"center","va":"middle","z":7,"th":"","lh":20,"td":"normal","bo":0,"i":0,"bg":"","bc":"","tc":"","o":100,"ts":0,"tsc":"#aaaaaa","ds":0,"sc":"#aaaaaa","ro":0,"padding":0,"ls":0,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"w018E02FD961510900881507","screen_cid":"sB88A4762131510816505717","timestamp":28539939,"v":true,"name":"button","left":555.5,"top":387.0,"width":85.0,"height":30.0,"gid":null,"locked":false,"text":"立即登入","fs":14,"br":4,"bs":6,"ha":"center","va":"middle","z":7,"th":"","td":"normal","bo":0,"i":0,"bg":"","bc":"","tc":"","o":100,"ts":0,"tsc":"#aaaaaa","ds":0,"sc":"#aaaaaa","ro":0,"ls":0,"icon":"","is":14,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"wEAFC0928951510900917584","screen_cid":"sB88A4762131510816505717","timestamp":28539949,"v":true,"name":"mtext_input","left":358.0,"top":195.0,"width":200.0,"height":30.0,"gid":null,"locked":false,"text":"单行输入","fs":14,"br":0,"bs":1,"ha":"left","z":7,"th":"","bg":"","bc":"","tc":"","o":100,"ds":0,"sc":"#aaaaaa","td":"normal","bo":0,"i":0,"ls":0,"fixed":false,"fixed_type":1,"input_type":"text"},{"cid":"wDA9D209B0F1510900920344","screen_cid":"sB88A4762131510816505717","timestamp":28539952,"v":true,"name":"mtext_input","left":358.0,"top":260.0,"width":200.0,"height":30.0,"gid":null,"locked":false,"text":"单行输入","fs":14,"br":0,"bs":1,"ha":"left","z":7,"th":"","bg":"","bc":"","tc":"","o":100,"ds":0,"sc":"#aaaaaa","td":"normal","bo":0,"i":0,"ls":0,"fixed":false,"fixed_type":1,"input_type":"text"},{"cid":"w85DA7287281510900923069","screen_cid":"sB88A4762131510816505717","timestamp":28539955,"v":true,"name":"mtext_input","left":358.0,"top":331.0,"width":200.0,"height":30.0,"gid":null,"locked":false,"text":"单行输入","fs":14,"br":0,"bs":1,"ha":"left","z":7,"th":"","bg":"","bc":"","tc":"","o":100,"ds":0,"sc":"#aaaaaa","td":"normal","bo":0,"i":0,"ls":0,"fixed":false,"fixed_type":1,"input_type":"text"},{"cid":"w7B53B4B4641510900963926","screen_cid":"sB88A4762131510816505717","timestamp":28539966,"v":true,"name":"icon_button","left":468.0,"top":383.0,"width":45.0,"height":45.0,"gid":null,"locked":false,"is":24,"icon":"fa-check-square-o","br":0,"bs":0,"z":7,"th":"","bg":"","bc":"","tc":"","o":100,"ds":0,"sc":"#aaaaaa","ro":0,"ls":0,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"w3562D5620D1510838050125","screen_cid":"s19016892F01510838050124","timestamp":28538639,"v":true,"name":"navigation_bar","left":null,"top":null,"width":800.0,"height":45.0,"gid":null,"locked":false,"text":"威德国际语言学校   XXX Englinsh Center","fs":18,"z":5,"th":"","td":"normal","bo":0,"i":0,"bg":"","tc":"","bc":"","o":100,"ts":0,"tsc":"#aaaaaa","ds":0,"sc":"#aaaaaa"},{"cid":"w347751B8C51510838050126","screen_cid":"s19016892F01510838050124","timestamp":28538646,"v":true,"name":"button","left":605.5,"top":45.0,"width":89.0,"height":30.0,"gid":null,"locked":false,"text":"我的檔案","fs":14,"br":4,"bs":1,"ha":"center","va":"middle","z":5,"th":"","td":"normal","bo":0,"i":0,"bg":"","bc":"","tc":"","o":100,"ts":0,"tsc":"#aaaaaa","ds":0,"sc":"#aaaaaa","ro":0,"ls":0,"icon":"","is":14,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"w89F526650B1510838050127","screen_cid":"s19016892F01510838050124","timestamp":28538651,"v":true,"name":"button","left":720.0,"top":45.0,"width":80.0,"height":30.0,"gid":null,"locked":false,"text":"登出","fs":14,"br":4,"bs":1,"ha":"center","va":"middle","z":5,"th":"","td":"normal","bo":0,"i":0,"bg":"","bc":"","tc":"","o":100,"ts":0,"tsc":"#aaaaaa","ds":0,"sc":"#aaaaaa","ro":0,"ls":0,"icon":"","is":14,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"w450A321FFB1510838050130","screen_cid":"s19016892F01510838050124","timestamp":28538734,"v":true,"name":"rounded_rect","left":0.0,"top":250.0,"width":169.0,"height":50.0,"gid":null,"locked":false,"text":"\u003cp\u003e 姓名：ＸＸＸ\u003c/p\u003e\u003cp\u003e 學號：ＸＸＸ\u003c/p\u003e","fs":14,"br":0,"bs":1,"ha":"center","va":"middle","z":5,"lh":20,"th":"","td":"normal","bo":0,"i":0,"bg":"","bc":"","tc":"","o":100,"ts":0,"tsc":"#aaaaaa","ds":0,"sc":"#aaaaaa","ro":0,"padding":0,"ls":0,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"w24DF4BB83D1510838050130","screen_cid":"s19016892F01510838050124","timestamp":28538745,"v":true,"name":"button","left":200.0,"top":45.0,"width":166.0,"height":30.0,"gid":null,"locked":false,"text":"查看未上課程","fs":14,"br":4,"bs":1,"ha":"center","va":"middle","z":5,"th":"","td":"normal","bo":0,"i":0,"bg":"","bc":"","tc":"","o":100,"ts":0,"tsc":"#aaaaaa","ds":0,"sc":"#aaaaaa","ro":0,"ls":0,"icon":"","is":14,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"wC68106C2871510838050131","screen_cid":"s19016892F01510838050124","timestamp":28538756,"v":true,"name":"icon_button","left":-5.0,"top":38.0,"width":45.0,"height":45.0,"gid":null,"locked":false,"is":24,"icon":"fa-twitter-square","br":0,"bs":0,"z":5,"th":"","bg":"","bc":"","tc":"","o":100,"ds":0,"sc":"#aaaaaa","ro":0,"ls":0,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"w0B026F2D821510838050132","screen_cid":"s19016892F01510838050124","timestamp":28538759,"v":true,"name":"icon_button","left":35.0,"top":38.0,"width":45.0,"height":45.0,"gid":null,"locked":false,"is":24,"icon":"fa-facebook-square","br":0,"bs":0,"z":5,"th":"","bg":"","bc":"","tc":"","o":100,"ds":0,"sc":"#aaaaaa","ro":0,"ls":0,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"wE050F3F8231510838050133","screen_cid":"s19016892F01510838050124","timestamp":28538764,"v":true,"name":"icon_button","left":10.0,"top":300.0,"width":45.0,"height":45.0,"gid":null,"locked":false,"is":24,"icon":"fa-book","br":0,"bs":0,"z":5,"th":"","bg":"","bc":"","tc":"","o":100,"ds":0,"sc":"#aaaaaa","ro":0,"ls":0,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"w70D7A2A4A51510838050134","screen_cid":"s19016892F01510838050124","timestamp":28538768,"v":true,"name":"icon_button","left":10.0,"top":345.0,"width":45.0,"height":45.0,"gid":null,"locked":false,"is":24,"icon":"fa-phone","br":0,"bs":0,"z":5,"th":"","bg":"","bc":"","tc":"","o":100,"ds":0,"sc":"#aaaaaa","ro":0,"ls":0,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"w81C92BFFA81510838050134","screen_cid":"s19016892F01510838050124","timestamp":28538772,"v":true,"name":"label","left":50.0,"top":314.0,"width":71.0,"height":23.0,"gid":null,"locked":false,"text":"\u003cp\u003e您的課時：\u003c/p\u003e","fs":14,"br":0,"bs":0,"ha":"center","va":"middle","z":5,"th":"","lh":20,"td":"normal","bo":0,"i":0,"bg":"","bc":"","tc":"","o":100,"ts":0,"tsc":"#aaaaaa","ds":0,"sc":"#aaaaaa","ro":0,"padding":0,"ls":0,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"wEA9346659D1510838050135","screen_cid":"s19016892F01510838050124","timestamp":28538776,"v":true,"name":"label","left":50.0,"top":356.0,"width":71.0,"height":23.0,"gid":null,"locked":false,"text":"\u003cp\u003e聯絡專員：\u003c/p\u003e","fs":14,"br":0,"bs":0,"ha":"center","va":"middle","z":5,"th":"","lh":20,"td":"normal","bo":0,"i":0,"bg":"","bc":"","tc":"","o":100,"ts":0,"tsc":"#aaaaaa","ds":0,"sc":"#aaaaaa","ro":0,"padding":0,"ls":0,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"w119C6460F71510838050136","screen_cid":"s19016892F01510838050124","timestamp":28538784,"v":true,"name":"rounded_rect","left":200.0,"top":200.0,"width":591.0,"height":100.0,"gid":null,"locked":false,"text":"\u003cp\u003e我的課表\u003c/p\u003e","fs":14,"br":0,"bs":1,"ha":"center","va":"middle","z":5,"lh":20,"th":"","td":"normal","bo":0,"i":0,"bg":"","bc":"","tc":"","o":100,"ts":0,"tsc":"#aaaaaa","ds":0,"sc":"#aaaaaa","ro":0,"padding":0,"ls":0,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"wCD82D3A2EE1510838050138","screen_cid":"s19016892F01510838050124","timestamp":28538944,"v":true,"name":"button","left":415.0,"top":45.0,"width":146.0,"height":30.0,"gid":null,"locked":false,"text":"查看已上課程","fs":14,"br":4,"bs":1,"ha":"center","va":"middle","z":5,"th":"","td":"normal","bo":0,"i":0,"bg":"","bc":"","tc":"","o":100,"ts":0,"tsc":"#aaaaaa","ds":0,"sc":"#aaaaaa","ro":0,"ls":0,"icon":"","is":14,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"wDEFC7081681510838050139","screen_cid":"s19016892F01510838050124","timestamp":28538981,"v":true,"name":"image_view","left":0.0,"top":110.0,"width":169.0,"height":140.0,"gid":null,"locked":false,"bs":0,"br":0,"image":"/uploads3/images/1445/14456845/raw_1510838092.svg","z":5,"th":"","bg":"","bc":"","tc":"","o":100,"p":true,"ds":0,"sc":"#aaaaaa","ro":0,"ls":0,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0","clip":null,"filter":""},{"cid":"wE958B81A1A1510838050139","screen_cid":"s19016892F01510838050124","timestamp":28538990,"v":true,"name":"image_view","left":14.0,"top":465.0,"width":80.0,"height":73.0,"gid":null,"locked":false,"bs":0,"br":0,"image":"/uploads3/images/1444/14448362/raw_1510824132.svg","z":5,"th":"","bg":"","bc":"","tc":"","o":100,"p":true,"ds":0,"sc":"#aaaaaa","ro":0,"ls":0,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0","clip":null,"filter":""},{"cid":"wF21444867F1510838050140","screen_cid":"s19016892F01510838050124","timestamp":28538993,"v":true,"name":"image_view","left":7.0,"top":390.0,"width":87.0,"height":74.0,"gid":null,"locked":false,"bs":0,"br":0,"image":"/uploads3/images/1444/14448379/raw_1510824148.svg","z":5,"th":"","bg":"","bc":"","tc":"","o":100,"p":true,"ds":0,"sc":"#aaaaaa","ro":0,"ls":0,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0","clip":null,"filter":""},{"cid":"w56216B0C551510838050142","screen_cid":"s19016892F01510838050124","timestamp":28539005,"v":true,"name":"label","left":101.0,"top":416.0,"width":57.0,"height":23.0,"gid":null,"locked":false,"text":"\u003cp\u003e重要通知\u003c/p\u003e","fs":14,"br":0,"bs":0,"ha":"center","va":"middle","z":5,"th":"","lh":20,"td":"normal","bo":0,"i":0,"bg":"","bc":"","tc":"","o":100,"ts":0,"tsc":"#aaaaaa","ds":0,"sc":"#aaaaaa","ro":0,"padding":0,"ls":0,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"wF1B3E9C59A1510838050142","screen_cid":"s19016892F01510838050124","timestamp":28539008,"v":true,"name":"label","left":101.0,"top":490.0,"width":57.0,"height":23.0,"gid":null,"locked":false,"text":"\u003cp\u003e意見回饋\u003c/p\u003e","fs":14,"br":0,"bs":0,"ha":"center","va":"middle","z":5,"th":"","lh":20,"td":"normal","bo":0,"i":0,"bg":"","bc":"","tc":"","o":100,"ts":0,"tsc":"#aaaaaa","ds":0,"sc":"#aaaaaa","ro":0,"padding":0,"ls":0,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"w636195BAFD1510838050143","screen_cid":"s19016892F01510838050124","timestamp":28539032,"v":true,"name":"image_view","left":200.0,"top":322.0,"width":591.0,"height":258.0,"gid":null,"locked":false,"bs":0,"br":0,"image":"/uploads3/images/1445/14456049/raw_1510836102.png","z":5,"th":"","bg":"","bc":"","tc":"","o":100,"p":true,"ds":0,"sc":"#aaaaaa","ro":0,"ls":0,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0","clip":null,"filter":""},{"cid":"w0C2A13FA581510838050144","screen_cid":"s19016892F01510838050124","timestamp":28539052,"v":true,"name":"mselect","left":216.0,"top":235.0,"width":85.0,"height":30.0,"gid":null,"locked":false,"text":"起始日期\n\n\n2\n3","fs":14,"bs":1,"z":5,"th":"","lh":20,"bg":"","bc":"","tc":"","o":100,"ds":0,"sc":"#aaaaaa","td":"normal","bo":0,"i":0,"ls":0,"fixed":false,"fixed_type":1},{"cid":"wF156EA119D1510838050145","screen_cid":"s19016892F01510838050124","timestamp":28539066,"v":true,"name":"mselect","left":313.0,"top":235.0,"width":85.0,"height":30.0,"gid":null,"locked":false,"text":"結束日期\n\n\n2\n3","fs":14,"bs":1,"z":5,"th":"","lh":20,"bg":"","bc":"","tc":"","o":100,"ds":0,"sc":"#aaaaaa","td":"normal","bo":0,"i":0,"ls":0,"fixed":false,"fixed_type":1},{"cid":"w4B0F0980061510838050146","screen_cid":"s19016892F01510838050124","timestamp":28539074,"v":true,"name":"circle_rect","left":546.0,"top":226.0,"width":44.0,"height":42.0,"gid":null,"locked":false,"text":"\u003cp\u003e額滿\u003c/p\u003e","fs":14,"bs":1,"ha":"center","va":"middle","z":5,"lh":20,"th":"","td":"normal","bo":0,"i":0,"bg":"","bc":"","tc":"","o":100,"ts":0,"tsc":"#aaaaaa","ds":0,"sc":"#aaaaaa","ro":0,"padding":0,"ls":0,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"w068F28B7B31510838050147","screen_cid":"s19016892F01510838050124","timestamp":28539081,"v":true,"name":"circle_rect","left":606.0,"top":226.0,"width":44.0,"height":42.0,"gid":null,"locked":false,"text":"\u003cp\u003e停課\u003c/p\u003e","fs":14,"bs":1,"ha":"center","va":"middle","z":5,"lh":20,"th":"","td":"normal","bo":0,"i":0,"bg":"","bc":"","tc":"","o":100,"ts":0,"tsc":"#aaaaaa","ds":0,"sc":"#aaaaaa","ro":0,"padding":0,"ls":0,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"w896F24086B1510838050147","screen_cid":"s19016892F01510838050124","timestamp":28539086,"v":true,"name":"circle_rect","left":669.0,"top":226.0,"width":44.0,"height":42.0,"gid":null,"locked":false,"text":"\u003cp\u003e調課\u003c/p\u003e","fs":14,"bs":1,"ha":"center","va":"middle","z":5,"lh":20,"th":"","td":"normal","bo":0,"i":0,"bg":"","bc":"","tc":"","o":100,"ts":0,"tsc":"#aaaaaa","ds":0,"sc":"#aaaaaa","ro":0,"padding":0,"ls":0,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"wDEE29295151510838050148","screen_cid":"s19016892F01510838050124","timestamp":28539095,"v":true,"name":"tab_bar","left":null,"top":null,"width":800.0,"height":45.0,"gid":null,"locked":false,"z":5,"th":"","bg":"","bc":"","o":100,"ds":0,"sc":"#aaaaaa","ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"wD617F3B5211510838050149","screen_cid":"s19016892F01510838050124","timestamp":28539106,"v":true,"name":"label","left":260.0,"top":566.0,"width":251.0,"height":23.0,"gid":null,"locked":false,"text":"\u003cp\u003e威德国际语言学校  祝您教學一切順利！ \u003c/p\u003e","fs":14,"br":0,"bs":0,"ha":"center","va":"middle","z":5,"th":"","lh":20,"td":"normal","bo":0,"i":0,"bg":"","bc":"","tc":"","o":100,"ts":0,"tsc":"#aaaaaa","ds":0,"sc":"#aaaaaa","ro":0,"padding":0,"ls":0,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"w7AE9BD89E61510838050149","screen_cid":"s19016892F01510838050124","timestamp":28539112,"v":true,"name":"label","left":585.5,"top":566.0,"width":106.0,"height":23.0,"gid":null,"locked":false,"text":"\u003cp\u003eXXX-XXXX-XXXX\u003c/p\u003e","fs":14,"br":0,"bs":0,"ha":"center","va":"middle","z":5,"th":"","lh":20,"td":"normal","bo":0,"i":0,"bg":"","bc":"","tc":"","o":100,"ts":0,"tsc":"#aaaaaa","ds":0,"sc":"#aaaaaa","ro":0,"padding":0,"ls":0,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"w8CADB669AB1510838659846","screen_cid":"s19016892F01510838050124","timestamp":28539304,"v":true,"name":"rounded_rect","left":200.0,"top":83.0,"width":593.0,"height":100.0,"gid":null,"locked":false,"text":"\u003cp\u003e最新消息/課程情報\u003c/p\u003e\u003cp\u003e 超神準雅思托福 最新考題預測\u003c/p\u003e","fs":14,"br":0,"bs":1,"ha":"center","va":"middle","z":5,"lh":20,"th":"","td":"normal","bo":0,"i":0,"bg":"","bc":"","tc":"","o":100,"ts":0,"tsc":"#aaaaaa","ds":0,"sc":"#aaaaaa","ro":0,"padding":0,"ls":0,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"wFCAD0DB79B1510838920125","screen_cid":"s19016892F01510838050124","timestamp":28539314,"v":true,"name":"icon_button","left":738.0,"top":226.0,"width":45.0,"height":45.0,"gid":null,"locked":false,"is":24,"icon":"fa-download","br":0,"bs":0,"z":5,"th":"","bg":"","bc":"","tc":"","o":100,"ds":0,"sc":"#aaaaaa","ro":0,"ls":0,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"w6C215490C31510838975351","screen_cid":"s19016892F01510838050124","timestamp":28539320,"v":true,"name":"icon_button","left":406.0,"top":223.0,"width":45.0,"height":45.0,"gid":null,"locked":false,"is":24,"icon":"fa-refresh","br":0,"bs":0,"z":5,"th":"","bg":"","bc":"","tc":"","o":100,"ds":0,"sc":"#aaaaaa","ro":0,"ls":0,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"w78A70755E31510838310816","screen_cid":"sA8DBD9D2741510838310816","timestamp":28538639,"v":true,"name":"navigation_bar","left":null,"top":null,"width":800.0,"height":45.0,"gid":null,"locked":false,"text":"威德国际语言学校    XXX Englinsh Center","fs":18,"z":5,"th":"","td":"normal","bo":0,"i":0,"bg":"","tc":"","bc":"","o":100,"ts":0,"tsc":"#aaaaaa","ds":0,"sc":"#aaaaaa"},{"cid":"w72A247EE1B1510838310817","screen_cid":"sA8DBD9D2741510838310816","timestamp":28538646,"v":true,"name":"button","left":605.5,"top":45.0,"width":89.0,"height":30.0,"gid":null,"locked":false,"text":"使用說明","fs":14,"br":4,"bs":1,"ha":"center","va":"middle","z":5,"th":"","td":"normal","bo":0,"i":0,"bg":"","bc":"","tc":"","o":100,"ts":0,"tsc":"#aaaaaa","ds":0,"sc":"#aaaaaa","ro":0,"ls":0,"icon":"","is":14,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"w11ED496F3B1510838310818","screen_cid":"sA8DBD9D2741510838310816","timestamp":28538651,"v":true,"name":"button","left":720.0,"top":45.0,"width":80.0,"height":30.0,"gid":null,"locked":false,"text":"登出","fs":14,"br":4,"bs":1,"ha":"center","va":"middle","z":5,"th":"","td":"normal","bo":0,"i":0,"bg":"","bc":"","tc":"","o":100,"ts":0,"tsc":"#aaaaaa","ds":0,"sc":"#aaaaaa","ro":0,"ls":0,"icon":"","is":14,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"w508BF59D5C1510838310819","screen_cid":"sA8DBD9D2741510838310816","timestamp":28538734,"v":true,"name":"rounded_rect","left":0.0,"top":250.0,"width":169.0,"height":50.0,"gid":null,"locked":false,"text":"\u003cp\u003e 姓名：ＸＸＸ\u003c/p\u003e\u003cp\u003e 學號：ＸＸＸ\u003c/p\u003e","fs":14,"br":0,"bs":1,"ha":"center","va":"middle","z":5,"lh":20,"th":"","td":"normal","bo":0,"i":0,"bg":"","bc":"","tc":"","o":100,"ts":0,"tsc":"#aaaaaa","ds":0,"sc":"#aaaaaa","ro":0,"padding":0,"ls":0,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"w1B0FBED0651510838310820","screen_cid":"sA8DBD9D2741510838310816","timestamp":28538745,"v":true,"name":"button","left":200.0,"top":45.0,"width":166.0,"height":30.0,"gid":null,"locked":false,"text":"查看未上課程","fs":14,"br":4,"bs":1,"ha":"center","va":"middle","z":5,"th":"","td":"normal","bo":0,"i":0,"bg":"","bc":"","tc":"","o":100,"ts":0,"tsc":"#aaaaaa","ds":0,"sc":"#aaaaaa","ro":0,"ls":0,"icon":"","is":14,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"w226DF4CB511510838310820","screen_cid":"sA8DBD9D2741510838310816","timestamp":28538756,"v":true,"name":"icon_button","left":-5.0,"top":38.0,"width":45.0,"height":45.0,"gid":null,"locked":false,"is":24,"icon":"fa-twitter-square","br":0,"bs":0,"z":5,"th":"","bg":"","bc":"","tc":"","o":100,"ds":0,"sc":"#aaaaaa","ro":0,"ls":0,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"w2499E01A5B1510838310821","screen_cid":"sA8DBD9D2741510838310816","timestamp":28538759,"v":true,"name":"icon_button","left":35.0,"top":38.0,"width":45.0,"height":45.0,"gid":null,"locked":false,"is":24,"icon":"fa-facebook-square","br":0,"bs":0,"z":5,"th":"","bg":"","bc":"","tc":"","o":100,"ds":0,"sc":"#aaaaaa","ro":0,"ls":0,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"w71B2A343301510838310822","screen_cid":"sA8DBD9D2741510838310816","timestamp":28538764,"v":true,"name":"icon_button","left":10.0,"top":300.0,"width":45.0,"height":45.0,"gid":null,"locked":false,"is":24,"icon":"fa-book","br":0,"bs":0,"z":5,"th":"","bg":"","bc":"","tc":"","o":100,"ds":0,"sc":"#aaaaaa","ro":0,"ls":0,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"w19F91B62271510838310824","screen_cid":"sA8DBD9D2741510838310816","timestamp":28538768,"v":true,"name":"icon_button","left":10.0,"top":345.0,"width":45.0,"height":45.0,"gid":null,"locked":false,"is":24,"icon":"fa-phone","br":0,"bs":0,"z":5,"th":"","bg":"","bc":"","tc":"","o":100,"ds":0,"sc":"#aaaaaa","ro":0,"ls":0,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"wBF17682ACC1510838310825","screen_cid":"sA8DBD9D2741510838310816","timestamp":28538772,"v":true,"name":"label","left":50.0,"top":314.0,"width":71.0,"height":23.0,"gid":null,"locked":false,"text":"\u003cp\u003e您的課時：\u003c/p\u003e","fs":14,"br":0,"bs":0,"ha":"center","va":"middle","z":5,"th":"","lh":20,"td":"normal","bo":0,"i":0,"bg":"","bc":"","tc":"","o":100,"ts":0,"tsc":"#aaaaaa","ds":0,"sc":"#aaaaaa","ro":0,"padding":0,"ls":0,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"w1121CDF0F81510838310826","screen_cid":"sA8DBD9D2741510838310816","timestamp":28538776,"v":true,"name":"label","left":50.0,"top":356.0,"width":71.0,"height":23.0,"gid":null,"locked":false,"text":"\u003cp\u003e聯絡專員：\u003c/p\u003e","fs":14,"br":0,"bs":0,"ha":"center","va":"middle","z":5,"th":"","lh":20,"td":"normal","bo":0,"i":0,"bg":"","bc":"","tc":"","o":100,"ts":0,"tsc":"#aaaaaa","ds":0,"sc":"#aaaaaa","ro":0,"padding":0,"ls":0,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"w0C49EBEDC91510838310826","screen_cid":"sA8DBD9D2741510838310816","timestamp":28538784,"v":true,"name":"rounded_rect","left":200.0,"top":200.0,"width":591.0,"height":100.0,"gid":null,"locked":false,"text":"\u003cp\u003e我的課表\u003c/p\u003e","fs":14,"br":0,"bs":1,"ha":"center","va":"middle","z":5,"lh":20,"th":"","td":"normal","bo":0,"i":0,"bg":"","bc":"","tc":"","o":100,"ts":0,"tsc":"#aaaaaa","ds":0,"sc":"#aaaaaa","ro":0,"padding":0,"ls":0,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"wBBE5C43A871510838310827","screen_cid":"sA8DBD9D2741510838310816","timestamp":28538795,"v":true,"name":"mselect","left":200.0,"top":110.0,"width":200.0,"height":30.0,"gid":null,"locked":false,"text":"排學生\n學生Ａ\n學生Ｂ\n學生Ｃ","fs":14,"bs":1,"z":5,"th":"","lh":20,"bg":"","bc":"","tc":"","o":100,"ds":0,"sc":"#aaaaaa","td":"normal","bo":0,"i":0,"ls":0,"fixed":false,"fixed_type":1},{"cid":"w9807DC33E41510838310828","screen_cid":"sA8DBD9D2741510838310816","timestamp":28538844,"v":true,"name":"mselect","left":200.0,"top":150.0,"width":200.0,"height":30.0,"gid":null,"locked":false,"text":"排老師\n老師Ａ\n老師Ｂ\n老師Ｃ\n\n","fs":14,"bs":1,"z":5,"th":"","lh":20,"bg":"","bc":"","tc":"","o":100,"ds":0,"sc":"#aaaaaa","td":"normal","bo":0,"i":0,"ls":0,"fixed":false,"fixed_type":1},{"cid":"w877CAB60501510838310828","screen_cid":"sA8DBD9D2741510838310816","timestamp":28538944,"v":true,"name":"button","left":415.0,"top":45.0,"width":146.0,"height":30.0,"gid":null,"locked":false,"text":"查看已上課程","fs":14,"br":4,"bs":1,"ha":"center","va":"middle","z":5,"th":"","td":"normal","bo":0,"i":0,"bg":"","bc":"","tc":"","o":100,"ts":0,"tsc":"#aaaaaa","ds":0,"sc":"#aaaaaa","ro":0,"ls":0,"icon":"","is":14,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"w42C431FD751510838310829","screen_cid":"sA8DBD9D2741510838310816","timestamp":28538981,"v":true,"name":"image_view","left":0.0,"top":110.0,"width":169.0,"height":140.0,"gid":null,"locked":false,"bs":0,"br":0,"image":"/uploads3/images/1445/14456904/raw_1510838361.svg","z":5,"th":"","bg":"","bc":"","tc":"","o":100,"p":true,"ds":0,"sc":"#aaaaaa","ro":0,"ls":0,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0","clip":null,"filter":""},{"cid":"w60F3F461081510838310830","screen_cid":"sA8DBD9D2741510838310816","timestamp":28538990,"v":true,"name":"image_view","left":14.0,"top":465.0,"width":80.0,"height":73.0,"gid":null,"locked":false,"bs":0,"br":0,"image":"/uploads3/images/1444/14448362/raw_1510824132.svg","z":5,"th":"","bg":"","bc":"","tc":"","o":100,"p":true,"ds":0,"sc":"#aaaaaa","ro":0,"ls":0,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0","clip":null,"filter":""},{"cid":"w2DCE2B2D621510838310831","screen_cid":"sA8DBD9D2741510838310816","timestamp":28538993,"v":true,"name":"image_view","left":7.0,"top":390.0,"width":87.0,"height":74.0,"gid":null,"locked":false,"bs":0,"br":0,"image":"/uploads3/images/1444/14448379/raw_1510824148.svg","z":5,"th":"","bg":"","bc":"","tc":"","o":100,"p":true,"ds":0,"sc":"#aaaaaa","ro":0,"ls":0,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0","clip":null,"filter":""},{"cid":"wF4F19A0D621510838310831","screen_cid":"sA8DBD9D2741510838310816","timestamp":28539005,"v":true,"name":"label","left":101.0,"top":416.0,"width":57.0,"height":23.0,"gid":null,"locked":false,"text":"\u003cp\u003e重要通知\u003c/p\u003e","fs":14,"br":0,"bs":0,"ha":"center","va":"middle","z":5,"th":"","lh":20,"td":"normal","bo":0,"i":0,"bg":"","bc":"","tc":"","o":100,"ts":0,"tsc":"#aaaaaa","ds":0,"sc":"#aaaaaa","ro":0,"padding":0,"ls":0,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"w41AF7D94A41510838310832","screen_cid":"sA8DBD9D2741510838310816","timestamp":28539008,"v":true,"name":"label","left":101.0,"top":490.0,"width":57.0,"height":23.0,"gid":null,"locked":false,"text":"\u003cp\u003e意見回饋\u003c/p\u003e","fs":14,"br":0,"bs":0,"ha":"center","va":"middle","z":5,"th":"","lh":20,"td":"normal","bo":0,"i":0,"bg":"","bc":"","tc":"","o":100,"ts":0,"tsc":"#aaaaaa","ds":0,"sc":"#aaaaaa","ro":0,"padding":0,"ls":0,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"w9FB0C2780C1510838310833","screen_cid":"sA8DBD9D2741510838310816","timestamp":28539032,"v":true,"name":"image_view","left":200.0,"top":322.0,"width":591.0,"height":258.0,"gid":null,"locked":false,"bs":0,"br":0,"image":"/uploads3/images/1445/14456049/raw_1510836102.png","z":5,"th":"","bg":"","bc":"","tc":"","o":100,"p":true,"ds":0,"sc":"#aaaaaa","ro":0,"ls":0,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0","clip":null,"filter":""},{"cid":"w3F58432CB81510838310833","screen_cid":"sA8DBD9D2741510838310816","timestamp":28539052,"v":true,"name":"mselect","left":211.0,"top":235.0,"width":85.0,"height":30.0,"gid":null,"locked":false,"text":"起始日期\n\n\n2\n3","fs":14,"bs":1,"z":5,"th":"","lh":20,"bg":"","bc":"","tc":"","o":100,"ds":0,"sc":"#aaaaaa","td":"normal","bo":0,"i":0,"ls":0,"fixed":false,"fixed_type":1},{"cid":"wA0AD523AB01510838310835","screen_cid":"sA8DBD9D2741510838310816","timestamp":28539066,"v":true,"name":"mselect","left":330.0,"top":235.0,"width":85.0,"height":30.0,"gid":null,"locked":false,"text":"結束日期\n\n\n2\n3","fs":14,"bs":1,"z":5,"th":"","lh":20,"bg":"","bc":"","tc":"","o":100,"ds":0,"sc":"#aaaaaa","td":"normal","bo":0,"i":0,"ls":0,"fixed":false,"fixed_type":1},{"cid":"w4023BB760E1510838310836","screen_cid":"sA8DBD9D2741510838310816","timestamp":28539074,"v":true,"name":"circle_rect","left":546.0,"top":226.0,"width":44.0,"height":42.0,"gid":null,"locked":false,"text":"\u003cp\u003e額滿\u003c/p\u003e","fs":14,"bs":1,"ha":"center","va":"middle","z":5,"lh":20,"th":"","td":"normal","bo":0,"i":0,"bg":"","bc":"","tc":"","o":100,"ts":0,"tsc":"#aaaaaa","ds":0,"sc":"#aaaaaa","ro":0,"padding":0,"ls":0,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"w3911D94F371510838310837","screen_cid":"sA8DBD9D2741510838310816","timestamp":28539081,"v":true,"name":"circle_rect","left":616.0,"top":226.0,"width":44.0,"height":42.0,"gid":null,"locked":false,"text":"\u003cp\u003e停課\u003c/p\u003e","fs":14,"bs":1,"ha":"center","va":"middle","z":5,"lh":20,"th":"","td":"normal","bo":0,"i":0,"bg":"","bc":"","tc":"","o":100,"ts":0,"tsc":"#aaaaaa","ds":0,"sc":"#aaaaaa","ro":0,"padding":0,"ls":0,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"w5A04E3E05D1510838310837","screen_cid":"sA8DBD9D2741510838310816","timestamp":28539086,"v":true,"name":"circle_rect","left":684.0,"top":226.0,"width":44.0,"height":42.0,"gid":null,"locked":false,"text":"\u003cp\u003e調課\u003c/p\u003e","fs":14,"bs":1,"ha":"center","va":"middle","z":5,"lh":20,"th":"","td":"normal","bo":0,"i":0,"bg":"","bc":"","tc":"","o":100,"ts":0,"tsc":"#aaaaaa","ds":0,"sc":"#aaaaaa","ro":0,"padding":0,"ls":0,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"w3B6120A0351510838310838","screen_cid":"sA8DBD9D2741510838310816","timestamp":28539095,"v":true,"name":"tab_bar","left":null,"top":null,"width":800.0,"height":45.0,"gid":null,"locked":false,"z":5,"th":"","bg":"","bc":"","o":100,"ds":0,"sc":"#aaaaaa","ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"w27336D67421510838310838","screen_cid":"sA8DBD9D2741510838310816","timestamp":28539106,"v":true,"name":"label","left":260.0,"top":566.0,"width":251.0,"height":23.0,"gid":null,"locked":false,"text":"\u003cp\u003e威德国际语言学校  祝您學習一切順利！ \u003c/p\u003e","fs":14,"br":0,"bs":0,"ha":"center","va":"middle","z":5,"th":"","lh":20,"td":"normal","bo":0,"i":0,"bg":"","bc":"","tc":"","o":100,"ts":0,"tsc":"#aaaaaa","ds":0,"sc":"#aaaaaa","ro":0,"padding":0,"ls":0,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"w7C201504241510838310839","screen_cid":"sA8DBD9D2741510838310816","timestamp":28539112,"v":true,"name":"label","left":585.5,"top":566.0,"width":106.0,"height":23.0,"gid":null,"locked":false,"text":"\u003cp\u003eXXX-XXXX-XXXX\u003c/p\u003e","fs":14,"br":0,"bs":0,"ha":"center","va":"middle","z":5,"th":"","lh":20,"td":"normal","bo":0,"i":0,"bg":"","bc":"","tc":"","o":100,"ts":0,"tsc":"#aaaaaa","ds":0,"sc":"#aaaaaa","ro":0,"padding":0,"ls":0,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"wC77E45C1681510839213383","screen_cid":"sF90675E0161510839213382","timestamp":28538639,"v":true,"name":"navigation_bar","left":null,"top":null,"width":800.0,"height":45.0,"gid":null,"locked":false,"text":"威德国际语言学校   XXX Englinsh Center","fs":18,"z":5,"th":"","td":"normal","bo":0,"i":0,"bg":"","tc":"","bc":"","o":100,"ts":0,"tsc":"#aaaaaa","ds":0,"sc":"#aaaaaa"},{"cid":"wF987DA093E1510839213384","screen_cid":"sF90675E0161510839213382","timestamp":28538646,"v":true,"name":"button","left":605.5,"top":45.0,"width":89.0,"height":30.0,"gid":null,"locked":false,"text":"我的檔案","fs":14,"br":4,"bs":1,"ha":"center","va":"middle","z":5,"th":"","td":"normal","bo":0,"i":0,"bg":"","bc":"","tc":"","o":100,"ts":0,"tsc":"#aaaaaa","ds":0,"sc":"#aaaaaa","ro":0,"ls":0,"icon":"","is":14,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"wCBD0F0D7321510839213385","screen_cid":"sF90675E0161510839213382","timestamp":28538651,"v":true,"name":"button","left":720.0,"top":45.0,"width":80.0,"height":30.0,"gid":null,"locked":false,"text":"登出","fs":14,"br":4,"bs":1,"ha":"center","va":"middle","z":5,"th":"","td":"normal","bo":0,"i":0,"bg":"","bc":"","tc":"","o":100,"ts":0,"tsc":"#aaaaaa","ds":0,"sc":"#aaaaaa","ro":0,"ls":0,"icon":"","is":14,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"w5948BA36421510839213387","screen_cid":"sF90675E0161510839213382","timestamp":28538734,"v":true,"name":"rounded_rect","left":0.0,"top":250.0,"width":169.0,"height":50.0,"gid":null,"locked":false,"text":"\u003cp\u003e 姓名：ＸＸＸ\u003c/p\u003e\u003cp\u003e 學號：ＸＸＸ\u003c/p\u003e","fs":14,"br":0,"bs":1,"ha":"center","va":"middle","z":5,"lh":20,"th":"","td":"normal","bo":0,"i":0,"bg":"","bc":"","tc":"","o":100,"ts":0,"tsc":"#aaaaaa","ds":0,"sc":"#aaaaaa","ro":0,"padding":0,"ls":0,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"wBD914660EB1510839213388","screen_cid":"sF90675E0161510839213382","timestamp":28538745,"v":true,"name":"button","left":200.0,"top":45.0,"width":166.0,"height":30.0,"gid":null,"locked":false,"text":"查看未上課程","fs":14,"br":4,"bs":1,"ha":"center","va":"middle","z":5,"th":"","td":"normal","bo":0,"i":0,"bg":"","bc":"","tc":"","o":100,"ts":0,"tsc":"#aaaaaa","ds":0,"sc":"#aaaaaa","ro":0,"ls":0,"icon":"","is":14,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"w5D5FDEB26C1510839213388","screen_cid":"sF90675E0161510839213382","timestamp":28538756,"v":true,"name":"icon_button","left":-5.0,"top":38.0,"width":45.0,"height":45.0,"gid":null,"locked":false,"is":24,"icon":"fa-twitter-square","br":0,"bs":0,"z":5,"th":"","bg":"","bc":"","tc":"","o":100,"ds":0,"sc":"#aaaaaa","ro":0,"ls":0,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"w7ABD5FC44F1510839213389","screen_cid":"sF90675E0161510839213382","timestamp":28538759,"v":true,"name":"icon_button","left":35.0,"top":38.0,"width":45.0,"height":45.0,"gid":null,"locked":false,"is":24,"icon":"fa-facebook-square","br":0,"bs":0,"z":5,"th":"","bg":"","bc":"","tc":"","o":100,"ds":0,"sc":"#aaaaaa","ro":0,"ls":0,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"w66FA5F330B1510839213390","screen_cid":"sF90675E0161510839213382","timestamp":28538764,"v":true,"name":"icon_button","left":10.0,"top":300.0,"width":45.0,"height":45.0,"gid":null,"locked":false,"is":24,"icon":"fa-book","br":0,"bs":0,"z":5,"th":"","bg":"","bc":"","tc":"","o":100,"ds":0,"sc":"#aaaaaa","ro":0,"ls":0,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"w395E8922261510839213390","screen_cid":"sF90675E0161510839213382","timestamp":28538768,"v":true,"name":"icon_button","left":10.0,"top":345.0,"width":45.0,"height":45.0,"gid":null,"locked":false,"is":24,"icon":"fa-phone","br":0,"bs":0,"z":5,"th":"","bg":"","bc":"","tc":"","o":100,"ds":0,"sc":"#aaaaaa","ro":0,"ls":0,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"w35E27A798C1510839213391","screen_cid":"sF90675E0161510839213382","timestamp":28538772,"v":true,"name":"label","left":50.0,"top":314.0,"width":71.0,"height":23.0,"gid":null,"locked":false,"text":"\u003cp\u003e您的課時：\u003c/p\u003e","fs":14,"br":0,"bs":0,"ha":"center","va":"middle","z":5,"th":"","lh":20,"td":"normal","bo":0,"i":0,"bg":"","bc":"","tc":"","o":100,"ts":0,"tsc":"#aaaaaa","ds":0,"sc":"#aaaaaa","ro":0,"padding":0,"ls":0,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"w9EE699122F1510839213393","screen_cid":"sF90675E0161510839213382","timestamp":28538776,"v":true,"name":"label","left":50.0,"top":356.0,"width":71.0,"height":23.0,"gid":null,"locked":false,"text":"\u003cp\u003e聯絡專員：\u003c/p\u003e","fs":14,"br":0,"bs":0,"ha":"center","va":"middle","z":5,"th":"","lh":20,"td":"normal","bo":0,"i":0,"bg":"","bc":"","tc":"","o":100,"ts":0,"tsc":"#aaaaaa","ds":0,"sc":"#aaaaaa","ro":0,"padding":0,"ls":0,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"w4A6A1485CF1510839213393","screen_cid":"sF90675E0161510839213382","timestamp":28538784,"v":true,"name":"rounded_rect","left":200.0,"top":200.0,"width":591.0,"height":100.0,"gid":null,"locked":false,"text":"\u003cp\u003e我的課表\u003c/p\u003e","fs":14,"br":0,"bs":1,"ha":"center","va":"middle","z":5,"lh":20,"th":"","td":"normal","bo":0,"i":0,"bg":"","bc":"","tc":"","o":100,"ts":0,"tsc":"#aaaaaa","ds":0,"sc":"#aaaaaa","ro":0,"padding":0,"ls":0,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"wE308E8AAFC1510839213394","screen_cid":"sF90675E0161510839213382","timestamp":28538944,"v":true,"name":"button","left":415.0,"top":45.0,"width":146.0,"height":30.0,"gid":null,"locked":false,"text":"查看已上課程","fs":14,"br":4,"bs":1,"ha":"center","va":"middle","z":5,"th":"","td":"normal","bo":0,"i":0,"bg":"","bc":"","tc":"","o":100,"ts":0,"tsc":"#aaaaaa","ds":0,"sc":"#aaaaaa","ro":0,"ls":0,"icon":"","is":14,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"wA98EBE02121510839213395","screen_cid":"sF90675E0161510839213382","timestamp":28538981,"v":true,"name":"image_view","left":0.0,"top":110.0,"width":169.0,"height":140.0,"gid":null,"locked":false,"bs":0,"br":0,"image":"/uploads3/images/1445/14457143/raw_1510839241.svg","z":5,"th":"","bg":"","bc":"","tc":"","o":100,"p":true,"ds":0,"sc":"#aaaaaa","ro":0,"ls":0,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0","clip":null,"filter":""},{"cid":"w071A707D891510839213396","screen_cid":"sF90675E0161510839213382","timestamp":28538990,"v":true,"name":"image_view","left":14.0,"top":465.0,"width":80.0,"height":73.0,"gid":null,"locked":false,"bs":0,"br":0,"image":"/uploads3/images/1444/14448362/raw_1510824132.svg","z":5,"th":"","bg":"","bc":"","tc":"","o":100,"p":true,"ds":0,"sc":"#aaaaaa","ro":0,"ls":0,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0","clip":null,"filter":""},{"cid":"wA8C0B4F1B91510839213396","screen_cid":"sF90675E0161510839213382","timestamp":28538993,"v":true,"name":"image_view","left":7.0,"top":390.0,"width":87.0,"height":74.0,"gid":null,"locked":false,"bs":0,"br":0,"image":"/uploads3/images/1444/14448379/raw_1510824148.svg","z":5,"th":"","bg":"","bc":"","tc":"","o":100,"p":true,"ds":0,"sc":"#aaaaaa","ro":0,"ls":0,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0","clip":null,"filter":""},{"cid":"w3FC07D67F21510839213398","screen_cid":"sF90675E0161510839213382","timestamp":28539005,"v":true,"name":"label","left":101.0,"top":416.0,"width":57.0,"height":23.0,"gid":null,"locked":false,"text":"\u003cp\u003e重要通知\u003c/p\u003e","fs":14,"br":0,"bs":0,"ha":"center","va":"middle","z":5,"th":"","lh":20,"td":"normal","bo":0,"i":0,"bg":"","bc":"","tc":"","o":100,"ts":0,"tsc":"#aaaaaa","ds":0,"sc":"#aaaaaa","ro":0,"padding":0,"ls":0,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"w37C540719E1510839213399","screen_cid":"sF90675E0161510839213382","timestamp":28539008,"v":true,"name":"label","left":101.0,"top":490.0,"width":57.0,"height":23.0,"gid":null,"locked":false,"text":"\u003cp\u003e意見回饋\u003c/p\u003e","fs":14,"br":0,"bs":0,"ha":"center","va":"middle","z":5,"th":"","lh":20,"td":"normal","bo":0,"i":0,"bg":"","bc":"","tc":"","o":100,"ts":0,"tsc":"#aaaaaa","ds":0,"sc":"#aaaaaa","ro":0,"padding":0,"ls":0,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"wD5006861DF1510839213400","screen_cid":"sF90675E0161510839213382","timestamp":28539032,"v":true,"name":"image_view","left":200.0,"top":322.0,"width":591.0,"height":258.0,"gid":null,"locked":false,"bs":0,"br":0,"image":"/uploads3/images/1445/14456049/raw_1510836102.png","z":5,"th":"","bg":"","bc":"","tc":"","o":100,"p":true,"ds":0,"sc":"#aaaaaa","ro":0,"ls":0,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0","clip":null,"filter":""},{"cid":"wA6849023E21510839213401","screen_cid":"sF90675E0161510839213382","timestamp":28539052,"v":true,"name":"mselect","left":216.0,"top":235.0,"width":85.0,"height":30.0,"gid":null,"locked":false,"text":"起始日期\n\n\n2\n3","fs":14,"bs":1,"z":5,"th":"","lh":20,"bg":"","bc":"","tc":"","o":100,"ds":0,"sc":"#aaaaaa","td":"normal","bo":0,"i":0,"ls":0,"fixed":false,"fixed_type":1},{"cid":"w14D7376BA41510839213401","screen_cid":"sF90675E0161510839213382","timestamp":28539066,"v":true,"name":"mselect","left":313.0,"top":235.0,"width":85.0,"height":30.0,"gid":null,"locked":false,"text":"結束日期\n\n\n2\n3","fs":14,"bs":1,"z":5,"th":"","lh":20,"bg":"","bc":"","tc":"","o":100,"ds":0,"sc":"#aaaaaa","td":"normal","bo":0,"i":0,"ls":0,"fixed":false,"fixed_type":1},{"cid":"w669EA41A2A1510839213403","screen_cid":"sF90675E0161510839213382","timestamp":28539081,"v":true,"name":"circle_rect","left":606.0,"top":226.0,"width":44.0,"height":42.0,"gid":null,"locked":false,"text":"\u003cp\u003e停課\u003c/p\u003e","fs":14,"bs":1,"ha":"center","va":"middle","z":5,"lh":20,"th":"","td":"normal","bo":0,"i":0,"bg":"","bc":"","tc":"","o":100,"ts":0,"tsc":"#aaaaaa","ds":0,"sc":"#aaaaaa","ro":0,"padding":0,"ls":0,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"wAEFF6D9E391510839213406","screen_cid":"sF90675E0161510839213382","timestamp":28539095,"v":true,"name":"tab_bar","left":null,"top":null,"width":800.0,"height":45.0,"gid":null,"locked":false,"z":5,"th":"","bg":"","bc":"","o":100,"ds":0,"sc":"#aaaaaa","ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"w419192CA021510839213406","screen_cid":"sF90675E0161510839213382","timestamp":28539106,"v":true,"name":"label","left":260.0,"top":566.0,"width":251.0,"height":23.0,"gid":null,"locked":false,"text":"\u003cp\u003e威德国际语言学校  祝您學習一切順利！ \u003c/p\u003e","fs":14,"br":0,"bs":0,"ha":"center","va":"middle","z":5,"th":"","lh":20,"td":"normal","bo":0,"i":0,"bg":"","bc":"","tc":"","o":100,"ts":0,"tsc":"#aaaaaa","ds":0,"sc":"#aaaaaa","ro":0,"padding":0,"ls":0,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"w8E2932C5AC1510839213407","screen_cid":"sF90675E0161510839213382","timestamp":28539112,"v":true,"name":"label","left":585.5,"top":566.0,"width":106.0,"height":23.0,"gid":null,"locked":false,"text":"\u003cp\u003eXXX-XXXX-XXXX\u003c/p\u003e","fs":14,"br":0,"bs":0,"ha":"center","va":"middle","z":5,"th":"","lh":20,"td":"normal","bo":0,"i":0,"bg":"","bc":"","tc":"","o":100,"ts":0,"tsc":"#aaaaaa","ds":0,"sc":"#aaaaaa","ro":0,"padding":0,"ls":0,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"wD04E2EEFEF1510839213408","screen_cid":"sF90675E0161510839213382","timestamp":28539304,"v":true,"name":"rounded_rect","left":200.0,"top":83.0,"width":593.0,"height":100.0,"gid":null,"locked":false,"text":"\u003cp\u003e最新消息/課程情報\u003c/p\u003e\u003cp\u003e 超神準雅思托福 最新考題預測\u003c/p\u003e","fs":14,"br":0,"bs":1,"ha":"center","va":"middle","z":5,"lh":20,"th":"","td":"normal","bo":0,"i":0,"bg":"","bc":"","tc":"","o":100,"ts":0,"tsc":"#aaaaaa","ds":0,"sc":"#aaaaaa","ro":0,"padding":0,"ls":0,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"w92DA19E2DD1510839213409","screen_cid":"sF90675E0161510839213382","timestamp":28539314,"v":true,"name":"icon_button","left":738.0,"top":226.0,"width":45.0,"height":45.0,"gid":null,"locked":false,"is":24,"icon":"fa-download","br":0,"bs":0,"z":5,"th":"","bg":"","bc":"","tc":"","o":100,"ds":0,"sc":"#aaaaaa","ro":0,"ls":0,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"w9CDE0AA6BC1510839213409","screen_cid":"sF90675E0161510839213382","timestamp":28539320,"v":true,"name":"icon_button","left":406.0,"top":223.0,"width":45.0,"height":45.0,"gid":null,"locked":false,"is":24,"icon":"fa-refresh","br":0,"bs":0,"z":5,"th":"","bg":"","bc":"","tc":"","o":100,"ds":0,"sc":"#aaaaaa","ro":0,"ls":0,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"w25E0E12F6B1510840520140","screen_cid":"s795AB88C291510840500648","timestamp":28539431,"v":true,"name":"navigation_bar","left":null,"top":null,"width":800.0,"height":45.0,"gid":null,"locked":false,"text":"評價與回饋","fs":18,"z":5,"th":"","td":"normal","bo":0,"i":0,"bg":"","tc":"","bc":"","o":100,"ts":0,"tsc":"#aaaaaa","ds":0,"sc":"#aaaaaa"},{"cid":"w40ACE33B091510841702626","screen_cid":"s4839A219651510841695782","timestamp":28539436,"v":true,"name":"navigation_bar","left":null,"top":null,"width":800.0,"height":45.0,"gid":null,"locked":false,"text":"","fs":18,"z":5,"th":"","td":"normal","bo":0,"i":0,"bg":"","tc":"","bc":"","o":100,"ts":0,"tsc":"#aaaaaa","ds":0,"sc":"#aaaaaa"},{"cid":"w9B4C7B474C1510842466963","screen_cid":"s4839A219651510841695782","timestamp":28539441,"v":true,"name":"label","left":376.0,"top":11.0,"width":85.0,"height":23.0,"gid":null,"locked":false,"text":"\u003cp\u003e基本资料维护\u003c/p\u003e","fs":14,"br":0,"bs":0,"ha":"center","va":"middle","z":5,"th":"","lh":20,"td":"normal","bo":0,"i":0,"bg":"","bc":"","tc":"","o":100,"ts":0,"tsc":"#aaaaaa","ds":0,"sc":"#aaaaaa","ro":0,"padding":0,"ls":0,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"w9DBC04F4771510842568872","screen_cid":"s4839A219651510841695782","timestamp":28539466,"v":true,"name":"mtext_input","left":119.0,"top":331.0,"width":200.0,"height":30.0,"gid":null,"locked":false,"text":"单行输入","fs":14,"br":23,"bs":1,"ha":"left","z":5,"th":"","bg":"#9ee8df","bc":"","tc":"","o":100,"ds":0,"sc":"#aaaaaa","td":"normal","bo":0,"i":0,"ls":0,"fixed":false,"fixed_type":1,"input_type":"text"},{"cid":"w81F72F6A561510842682208","screen_cid":"s4839A219651510841695782","timestamp":28539492,"v":true,"name":"mtext_input","left":529.0,"top":178.0,"width":200.0,"height":30.0,"gid":null,"locked":false,"text":"单行输入","fs":14,"br":23,"bs":1,"ha":"left","z":5,"th":"","bg":"#9ee8df","bc":"","tc":"","o":100,"ds":0,"sc":"#aaaaaa","td":"normal","bo":0,"i":0,"ls":0,"fixed":false,"fixed_type":1,"input_type":"text"},{"cid":"w6FFB9EAE181510842691095","screen_cid":"s4839A219651510841695782","timestamp":28539499,"v":true,"name":"mtext_input","left":119.0,"top":279.0,"width":200.0,"height":30.0,"gid":null,"locked":false,"text":"单行输入","fs":14,"br":23,"bs":1,"ha":"left","z":5,"th":"","bg":"#9ee8df","bc":"","tc":"","o":100,"ds":0,"sc":"#aaaaaa","td":"normal","bo":0,"i":0,"ls":0,"fixed":false,"fixed_type":1,"input_type":"text"},{"cid":"wD1ADA883AC1510842693993","screen_cid":"s4839A219651510841695782","timestamp":28539503,"v":true,"name":"mtext_input","left":119.0,"top":232.0,"width":200.0,"height":30.0,"gid":null,"locked":false,"text":"单行输入","fs":14,"br":23,"bs":1,"ha":"left","z":5,"th":"","bg":"#9ee8df","bc":"","tc":"","o":100,"ds":0,"sc":"#aaaaaa","td":"normal","bo":0,"i":0,"ls":0,"fixed":false,"fixed_type":1,"input_type":"text"},{"cid":"wF572090CB11510842697379","screen_cid":"s4839A219651510841695782","timestamp":28539507,"v":true,"name":"mtext_input","left":119.0,"top":178.0,"width":200.0,"height":30.0,"gid":null,"locked":false,"text":"单行输入","fs":14,"br":23,"bs":1,"ha":"left","z":5,"th":"","bg":"#9ee8df","bc":"","tc":"","o":100,"ds":0,"sc":"#aaaaaa","td":"normal","bo":0,"i":0,"ls":0,"fixed":false,"fixed_type":1,"input_type":"text"},{"cid":"w8CEDB5A9BC1510842762794","screen_cid":"s4839A219651510841695782","timestamp":28539519,"v":true,"name":"icon_button","left":519.0,"top":0.0,"width":45.0,"height":45.0,"gid":null,"locked":false,"is":24,"icon":"fa-address-card","br":0,"bs":0,"z":5,"th":"","bg":"","bc":"","tc":"","o":100,"ds":0,"sc":"#aaaaaa","ro":0,"ls":0,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"w72183B29691510842868150","screen_cid":"s4839A219651510841695782","timestamp":28539523,"v":true,"name":"label","left":39.0,"top":185.0,"width":57.0,"height":23.0,"gid":null,"locked":false,"text":"\u003cp\u003e学员姓名\u003c/p\u003e\u003cp\u003e\u003cbr\u003e\u003c/p\u003e","fs":14,"br":0,"bs":0,"ha":"center","va":"middle","z":5,"th":"","lh":20,"td":"normal","bo":0,"i":0,"bg":"","bc":"","tc":"","o":100,"ts":0,"tsc":"#aaaaaa","ds":0,"sc":"#aaaaaa","ro":0,"padding":0,"ls":0,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"wAC655E3FF21510842911259","screen_cid":"s4839A219651510841695782","timestamp":28539527,"v":true,"name":"label","left":39.0,"top":236.0,"width":57.0,"height":23.0,"gid":null,"locked":false,"text":"\u003cp\u003e手机号码\u003c/p\u003e","fs":14,"br":0,"bs":0,"ha":"center","va":"middle","z":5,"th":"","lh":20,"td":"normal","bo":0,"i":0,"bg":"","bc":"","tc":"","o":100,"ts":0,"tsc":"#aaaaaa","ds":0,"sc":"#aaaaaa","ro":0,"padding":0,"ls":0,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"wF08BE114221510842915279","screen_cid":"s4839A219651510841695782","timestamp":28539530,"v":true,"name":"label","left":39.0,"top":289.0,"width":57.0,"height":23.0,"gid":null,"locked":false,"text":"\u003cp\u003e联络电话\u003c/p\u003e\u003cp\u003e\u003cbr\u003e\u003c/p\u003e\u003cp\u003e\u003cbr\u003e\u003c/p\u003e","fs":14,"br":0,"bs":0,"ha":"center","va":"middle","z":5,"th":"","lh":20,"td":"normal","bo":0,"i":0,"bg":"","bc":"","tc":"","o":100,"ts":0,"tsc":"#aaaaaa","ds":0,"sc":"#aaaaaa","ro":0,"padding":0,"ls":0,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"w2CD51741E01510842920762","screen_cid":"s4839A219651510841695782","timestamp":28539536,"v":true,"name":"label","left":427.0,"top":239.0,"width":85.0,"height":23.0,"gid":null,"locked":false,"text":"\u003cp\u003e优先排课时间\u003c/p\u003e","fs":14,"br":0,"bs":0,"ha":"center","va":"middle","z":5,"th":"","lh":20,"td":"normal","bo":0,"i":0,"bg":"","bc":"","tc":"","o":100,"ts":0,"tsc":"#aaaaaa","ds":0,"sc":"#aaaaaa","ro":0,"padding":0,"ls":0,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"wF175DD44C01510843060776","screen_cid":"s4839A219651510841695782","timestamp":28539555,"v":true,"name":"label","left":39.0,"top":335.0,"width":57.0,"height":23.0,"gid":null,"locked":false,"text":"\u003cp\u003e电子邮件\u003c/p\u003e\u003cp\u003e\u003cbr\u003e\u003c/p\u003e","fs":14,"br":0,"bs":0,"ha":"center","va":"middle","z":5,"th":"","lh":20,"td":"normal","bo":0,"i":0,"bg":"","bc":"","tc":"","o":100,"ts":0,"tsc":"#aaaaaa","ds":0,"sc":"#aaaaaa","ro":0,"padding":0,"ls":0,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"w6BDEF7A5DA1510843136172","screen_cid":"s4839A219651510841695782","timestamp":28539563,"v":true,"name":"label","left":427.0,"top":182.0,"width":85.0,"height":23.0,"gid":null,"locked":false,"text":"\u003cp\u003e修改个人密码\u003c/p\u003e","fs":14,"br":0,"bs":0,"ha":"center","va":"middle","z":5,"th":"","lh":20,"td":"normal","bo":0,"i":0,"bg":"","bc":"","tc":"","o":100,"ts":0,"tsc":"#aaaaaa","ds":0,"sc":"#aaaaaa","ro":0,"padding":0,"ls":0,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"wB74B86106C1510843167417","screen_cid":"s4839A219651510841695782","timestamp":28539569,"v":true,"name":"mselect","left":529.0,"top":232.0,"width":200.0,"height":30.0,"gid":null,"locked":false,"text":"1. 上午\n2. 下午\n3. 晚上","fs":14,"bs":1,"z":5,"th":"","lh":20,"bg":"#95ede3","bc":"","tc":"","o":100,"ds":0,"sc":"#aaaaaa","td":"normal","bo":0,"i":0,"ls":0,"fixed":false,"fixed_type":1},{"cid":"w3A4E83E01C1510843456766","screen_cid":"s4839A219651510841695782","timestamp":28539604,"v":true,"name":"label","left":319.0,"top":118.0,"width":119.0,"height":23.0,"gid":null,"locked":false,"text":"\u003cp\u003e学籍编号12345678\u003c/p\u003e\u003cp\u003e\u003cbr\u003e\u003c/p\u003e","fs":14,"br":0,"bs":0,"ha":"center","va":"middle","z":5,"th":"","lh":20,"td":"normal","bo":0,"i":0,"bg":"","bc":"","tc":"","o":100,"ts":0,"tsc":"#aaaaaa","ds":0,"sc":"#aaaaaa","ro":0,"padding":0,"ls":0,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"w5D1363110F1510843565533","screen_cid":"s4839A219651510841695782","timestamp":28539614,"v":true,"name":"mselect","left":529.0,"top":286.0,"width":200.0,"height":30.0,"gid":null,"locked":false,"text":"接受\n不接受\n \n ","fs":14,"bs":1,"z":5,"th":"","lh":20,"bg":"#a8f0e7","bc":"","tc":"","o":100,"ds":0,"sc":"#aaaaaa","td":"normal","bo":0,"i":0,"ls":0,"fixed":false,"fixed_type":1},{"cid":"wBB20DE34631510843604190","screen_cid":"s4839A219651510841695782","timestamp":28539620,"v":true,"name":"label","left":424.5,"top":286.0,"width":90.0,"height":23.0,"gid":null,"locked":false,"text":"\u003cp\u003e电子报E-mail :\u003c/p\u003e","fs":14,"br":0,"bs":0,"ha":"center","va":"middle","z":5,"th":"","lh":20,"td":"normal","bo":0,"i":0,"bg":"","bc":"","tc":"","o":100,"ts":0,"tsc":"#aaaaaa","ds":0,"sc":"#aaaaaa","ro":0,"padding":0,"ls":0,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"w3EB30E9EF11510843688171","screen_cid":"s4839A219651510841695782","timestamp":28539630,"v":true,"name":"tab_bar","left":null,"top":null,"width":800.0,"height":45.0,"gid":null,"locked":false,"z":5,"th":"","bg":"","bc":"","o":100,"ds":0,"sc":"#aaaaaa","ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"wEED037DC791510843796226","screen_cid":"s4839A219651510841695782","timestamp":28539641,"v":true,"name":"tab_bar","left":null,"top":null,"width":800.0,"height":45.0,"gid":null,"locked":false,"z":5,"th":"","bg":"","bc":"","o":100,"ds":0,"sc":"#aaaaaa","ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"w5413FBBC921510843865799","screen_cid":"s4839A219651510841695782","timestamp":28539647,"v":true,"name":"label","left":344.0,"top":566.0,"width":113.0,"height":23.0,"gid":null,"locked":false,"text":"\u003cp\u003e威德国际语言学校\u003c/p\u003e","fs":14,"br":0,"bs":0,"ha":"center","va":"middle","z":5,"th":"","lh":20,"td":"normal","bo":0,"i":0,"bg":"","bc":"","tc":"","o":100,"ts":0,"tsc":"#aaaaaa","ds":0,"sc":"#aaaaaa","ro":0,"padding":0,"ls":0,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"wB53AA145061510843888396","screen_cid":"s4839A219651510841695782","timestamp":28539651,"v":true,"name":"label","left":563.5,"top":566.0,"width":88.0,"height":23.0,"gid":null,"locked":false,"text":"\u003cp\u003exxxxxxxxxxxx\u003c/p\u003e","fs":14,"br":0,"bs":0,"ha":"center","va":"middle","z":5,"th":"","lh":20,"td":"normal","bo":0,"i":0,"bg":"","bc":"","tc":"","o":100,"ts":0,"tsc":"#aaaaaa","ds":0,"sc":"#aaaaaa","ro":0,"padding":0,"ls":0,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"w373E93053B1510844003526","screen_cid":"s4839A219651510841695782","timestamp":28539660,"v":true,"name":"button","left":348.5,"top":423.0,"width":103.0,"height":30.0,"gid":null,"locked":false,"text":"确定修改","fs":14,"br":4,"bs":1,"ha":"center","va":"middle","z":5,"th":"","td":"normal","bo":0,"i":0,"bg":"#5cdbcc","bc":"","tc":"#1b1c1c","o":100,"ts":0,"tsc":"#aaaaaa","ds":0,"sc":"#aaaaaa","ro":0,"ls":0,"icon":"","is":14,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"wBAD59581E11510897958953","screen_cid":"s4839A219651510841695782","timestamp":28539788,"v":true,"name":"button","left":39.0,"top":45.0,"width":155.0,"height":31.0,"gid":null,"locked":false,"text":"按钮","fs":14,"br":4,"bs":1,"ha":"center","va":"middle","z":5,"th":"","td":"normal","bo":0,"i":0,"bg":"","bc":"","tc":"","o":100,"ts":0,"tsc":"#aaaaaa","ds":0,"sc":"#aaaaaa","ro":0,"ls":0,"icon":"","is":14,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"w3A3019F1091510897998833","screen_cid":"s4839A219651510841695782","timestamp":28539792,"v":true,"name":"button","left":227.0,"top":46.0,"width":80.0,"height":30.0,"gid":null,"locked":false,"text":"返回主页","fs":14,"br":4,"bs":1,"ha":"center","va":"middle","z":5,"th":"","td":"normal","bo":0,"i":0,"bg":"","bc":"","tc":"","o":100,"ts":0,"tsc":"#aaaaaa","ds":0,"sc":"#aaaaaa","ro":0,"ls":0,"icon":"","is":14,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"wB5BF9C8D2B1510894446019","screen_cid":"s6E2C4802491510894438885","timestamp":28539680,"v":true,"name":"navigation_bar","left":null,"top":null,"width":800.0,"height":45.0,"gid":null,"locked":false,"text":"我的檔案","fs":18,"z":5,"th":"","td":"normal","bo":0,"i":0,"bg":"","tc":"","bc":"","o":100,"ts":0,"tsc":"#aaaaaa","ds":0,"sc":"#aaaaaa"},{"cid":"wB2CD1964571510896821468","screen_cid":"s6E2C4802491510894438885","timestamp":28539710,"v":true,"name":"image_view","left":259.0,"top":164.0,"width":313.0,"height":272.0,"gid":null,"locked":false,"bs":0,"br":0,"image":"/uploads3/images/1447/14473403/raw_1510896830.svg","z":5,"th":"","bg":"","bc":"","tc":"","o":100,"p":true,"ds":0,"sc":"#aaaaaa","ro":0,"ls":0,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0","clip":null,"filter":""},{"cid":"w016FF931111510897053549","screen_cid":"s6E2C4802491510894438885","timestamp":28539719,"v":true,"name":"image_view","left":61.0,"top":280.0,"width":76.0,"height":73.0,"gid":null,"locked":false,"bs":0,"br":0,"image":"/uploads3/images/1447/14473548/raw_1510897058.svg","z":5,"th":"","bg":"","bc":"","tc":"","o":100,"p":true,"ds":0,"sc":"#aaaaaa","ro":0,"ls":0,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0","clip":null,"filter":""},{"cid":"w2F8531E4451510897059993","screen_cid":"s6E2C4802491510894438885","timestamp":28539724,"v":true,"name":"image_view","left":63.0,"top":428.0,"width":74.0,"height":94.0,"gid":null,"locked":false,"bs":0,"br":0,"image":"/uploads3/images/1447/14473550/raw_1510897064.png","z":5,"th":"","bg":"","bc":"","tc":"","o":100,"p":true,"ds":0,"sc":"#aaaaaa","ro":0,"ls":0,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0","clip":null,"filter":""},{"cid":"w40EC19C69B1510897082462","screen_cid":"s6E2C4802491510894438885","timestamp":28539728,"v":true,"name":"image_view","left":53.0,"top":100.0,"width":92.0,"height":106.0,"gid":null,"locked":false,"bs":0,"br":0,"image":"/uploads3/images/1447/14473569/raw_1510897084.svg","z":5,"th":"","bg":"","bc":"","tc":"","o":100,"p":true,"ds":0,"sc":"#aaaaaa","ro":0,"ls":0,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0","clip":null,"filter":""},{"cid":"w15AD4B30DA1510897157692","screen_cid":"s6E2C4802491510894438885","timestamp":28539739,"v":true,"name":"triangletl","left":504.0,"top":133.0,"width":40.0,"height":40.0,"gid":null,"locked":false,"z":5,"th":"","tc":"#95ede3","o":100,"ro":0,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"wE19FACBD181510897162466","screen_cid":"s6E2C4802491510894438885","timestamp":28539742,"v":true,"name":"triangletl","left":504.0,"top":93.0,"width":40.0,"height":40.0,"gid":null,"locked":false,"z":5,"th":"","tc":"#95ede3","o":100,"ro":270,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"w487CCF29BE1510897181437","screen_cid":"s6E2C4802491510894438885","timestamp":28539747,"v":true,"name":"rounded_rect","left":315.0,"top":118.0,"width":200.0,"height":29.0,"gid":null,"locked":false,"text":"","fs":14,"br":28,"bs":0,"ha":"center","va":"middle","z":5,"lh":20,"th":"","td":"normal","bo":0,"i":0,"bg":"#95ede3","bc":"#eb78a1","tc":"","o":100,"ts":0,"tsc":"#aaaaaa","ds":0,"sc":"#aaaaaa","ro":0,"padding":0,"ls":0,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"w4182DF234C1510897276594","screen_cid":"s6E2C4802491510894438885","timestamp":28539757,"v":true,"name":"label","left":353.0,"top":74.0,"width":113.0,"height":34.0,"gid":null,"locked":false,"text":"\u003cp\u003e累积课时能量：\u003c/p\u003e","fs":14,"br":0,"bs":7,"ha":"center","va":"middle","z":5,"th":"","lh":20,"td":"normal","bo":0,"i":0,"bg":"","bc":"#ffffff","tc":"","o":100,"ts":0,"tsc":"#aaaaaa","ds":0,"sc":"#aaaaaa","ro":0,"padding":0,"ls":0,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"wEC9F88859C1510897399130","screen_cid":"s6E2C4802491510894438885","timestamp":28539769,"v":true,"name":"label","left":581.5,"top":83.0,"width":86.0,"height":99.0,"gid":null,"locked":false,"text":"\u003cp\u003e 236分钟\u003c/p\u003e\u003cp\u003e\u003cbr\u003e\u003c/p\u003e","fs":14,"br":7,"bs":0,"ha":"center","va":"middle","z":5,"th":"","lh":65,"td":"normal","bo":0,"i":0,"bg":"","bc":"#a57ca6","tc":"","o":100,"ts":0,"tsc":"#aaaaaa","ds":0,"sc":"#aaaaaa","ro":0,"padding":15,"ls":0,"fixed":false,"fixed_type":1,"ani_name":"bounce","ani_delay":"0","ani_count":"infinite","ani_duration":"3s"},{"cid":"wBD691074BB1510897470338","screen_cid":"s6E2C4802491510894438885","timestamp":28539774,"v":true,"name":"hr","left":165.0,"top":202.0,"width":155.0,"height":10.0,"gid":null,"locked":false,"o":100,"z":5,"th":"","bc":"","ls":0,"ro":30,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"w13D24ED8FC1510897475872","screen_cid":"s6E2C4802491510894438885","timestamp":28539779,"v":true,"name":"hr","left":165.0,"top":321.0,"width":150.0,"height":10.0,"gid":null,"locked":false,"o":100,"z":5,"th":"","bc":"","ls":0,"ro":0,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"w9DAC4A19471510897478693","screen_cid":"s6E2C4802491510894438885","timestamp":28539782,"v":true,"name":"hr","left":169.0,"top":438.0,"width":150.0,"height":10.0,"gid":null,"locked":false,"o":100,"z":5,"th":"","bc":"","ls":0,"ro":338,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"wFD8090CC5A1510899613260","screen_cid":"s6E2C4802491510894438885","timestamp":28539838,"v":true,"name":"button","left":30.0,"top":45.0,"width":139.0,"height":30.0,"gid":null,"locked":false,"text":"返回主页","fs":14,"br":4,"bs":1,"ha":"center","va":"middle","z":5,"th":"","td":"normal","bo":0,"i":0,"bg":"","bc":"","tc":"","o":100,"ts":0,"tsc":"#aaaaaa","ds":0,"sc":"#aaaaaa","ro":0,"ls":0,"icon":"","is":14,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"w0C01FA46861510899959838","screen_cid":"s6E2C4802491510894438885","timestamp":28539861,"v":true,"name":"label","left":35.0,"top":522.0,"width":129.0,"height":23.0,"gid":null,"locked":false,"text":"\u003cp\u003e托福 / 雅思 考题解锁\u003c/p\u003e\u003cp\u003e\u003cbr\u003e\u003c/p\u003e\u003cp\u003e\u003cbr\u003e\u003c/p\u003e","fs":14,"br":0,"bs":0,"ha":"center","va":"middle","z":5,"th":"","lh":20,"td":"normal","bo":0,"i":0,"bg":"","bc":"","tc":"","o":100,"ts":0,"tsc":"#aaaaaa","ds":0,"sc":"#aaaaaa","ro":0,"padding":0,"ls":0,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"wAC5DC461EB1510899964615","screen_cid":"s6E2C4802491510894438885","timestamp":28539864,"v":true,"name":"label","left":71.0,"top":371.0,"width":57.0,"height":23.0,"gid":null,"locked":false,"text":"\u003cp\u003e考试倒数\u003c/p\u003e\u003cp\u003e\u003cbr\u003e\u003c/p\u003e\u003cp\u003e\u003cbr\u003e\u003c/p\u003e","fs":14,"br":0,"bs":0,"ha":"center","va":"middle","z":5,"th":"","lh":20,"td":"normal","bo":0,"i":0,"bg":"","bc":"","tc":"","o":100,"ts":0,"tsc":"#aaaaaa","ds":0,"sc":"#aaaaaa","ro":0,"padding":0,"ls":0,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"wF0F81414481510899967412","screen_cid":"s6E2C4802491510894438885","timestamp":28539867,"v":true,"name":"label","left":71.0,"top":216.0,"width":57.0,"height":23.0,"gid":null,"locked":false,"text":"\u003cp\u003e课堂表现\u003c/p\u003e\u003cp\u003e\u003cbr\u003e\u003c/p\u003e\u003cp\u003e\u003cbr\u003e\u003c/p\u003e","fs":14,"br":0,"bs":0,"ha":"center","va":"middle","z":5,"th":"","lh":20,"td":"normal","bo":0,"i":0,"bg":"","bc":"","tc":"","o":100,"ts":0,"tsc":"#aaaaaa","ds":0,"sc":"#aaaaaa","ro":0,"padding":0,"ls":0,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"w3204A597A21510900185086","screen_cid":"s6E2C4802491510894438885","timestamp":28539881,"v":true,"name":"tab_bar","left":null,"top":null,"width":800.0,"height":45.0,"gid":null,"locked":false,"z":5,"th":"","bg":"","bc":"","o":100,"ds":0,"sc":"#aaaaaa","ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"w6F1F9EA6E61510900247383","screen_cid":"s6E2C4802491510894438885","timestamp":28539885,"v":true,"name":"label","left":293.0,"top":566.0,"width":215.0,"height":23.0,"gid":null,"locked":false,"text":"\u003cp\u003e威德国际语言学校 祝您轻松迎战！\u003c/p\u003e","fs":14,"br":0,"bs":0,"ha":"center","va":"middle","z":5,"th":"","lh":20,"td":"normal","bo":0,"i":0,"bg":"","bc":"","tc":"","o":100,"ts":0,"tsc":"#aaaaaa","ds":0,"sc":"#aaaaaa","ro":0,"padding":0,"ls":0,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0"},{"cid":"wDF5176FC6A1510902414475","screen_cid":"s6E2C4802491510894438885","timestamp":28540013,"v":true,"name":"image_view","left":515.0,"top":182.0,"width":160.0,"height":162.0,"gid":null,"locked":false,"bs":0,"br":0,"image":"/uploads3/images/1447/14479583/raw_1510902415.svg","z":5,"th":"","bg":"","bc":"","tc":"","o":100,"p":true,"ds":0,"sc":"#aaaaaa","ro":0,"ls":0,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0","clip":null,"filter":""},{"cid":"wBBC469BF5A1510902523759","screen_cid":"s6E2C4802491510894438885","timestamp":28540018,"v":true,"name":"text_view","left":551.0,"top":224.0,"width":200.0,"height":45.0,"gid":null,"locked":false,"text":"\u003cp\u003e唯有持之以恒，\u003c/p\u003e\u003cp\u003e才能积累成功。\u003c/p\u003e","fs":14,"br":0,"bs":0,"ha":"left","va":"top","z":5,"th":"","lh":20,"td":"normal","bo":0,"i":0,"bg":"","bc":"","tc":"","o":100,"ts":0,"tsc":"#aaaaaa","ds":0,"sc":"#aaaaaa","ro":0,"padding":0,"ls":0,"fixed":false,"fixed_type":1,"ani_name":"none","ani_delay":"0","ani_count":"1","ani_duration":"0","clip":null}],"links":[],"panels":[],"screen_aligns":[],"screenstates":[],"widgetstates":[],"panelstates":[],"devices":{"android":{"google_nexus":{"width":360,"height":640,"name":"Google Pixel"},"samsung":{"width":360,"height":640,"name":"Samsung"},"Xiaomi":{"width":360,"height":640,"name":"XiaoMi"},"Huawei":{"width":360,"height":640,"name":"Huawei"},"Meizu":{"width":360,"height":600,"name":"Meizu","hide":true},"google_nexus_4":{"width":384,"height":640,"name":"Google Nexus 4","hide":true},"customize":{"width":360,"height":640,"name":"Customize"}},"iphone":{"iphone_4":{"width":320,"height":480,"scale":100,"icon_size":"120x120","name":"iPhone 4","hide":true},"iphone_5":{"width":320,"height":568,"scale":100,"icon_size":"120x120","name":"iPhone 5/SE"},"iphone_6":{"width":375,"height":667,"scale":100,"icon_size":"180x180","name":"iPhone 6/7/8"},"iphone_6_plus":{"width":414,"height":736,"scale":100,"icon_size":"180x180","name":"iPhone 6/7/8 Plus"},"iphone_x":{"width":375,"height":812,"scale":100,"icon_size":"180x180","name":"iPhone X"}},"ipad":{"ipad_3_4":{"width":768,"height":1024,"scale":75,"icon_size":"152x152","name":"iPad"},"ipad_pro":{"width":1024,"height":1366,"scale":75,"icon_size":"152x152","name":"iPad Pro"}},"web":{"desktop":{"width":1440,"height":1024,"name":"Webpage"}},"default":{"iphone":"iphone_5","ipad":"ipad_3_4","android":"google_nexus"}},"collaborators":[],"threads":[],"comments":[],"teams":[]}</script>