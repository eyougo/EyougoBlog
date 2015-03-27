<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=0.8" />
    <link media="all" type="text/css" rel="stylesheet" href="http://www.cssass.com/public/css/reset.css"/>
    <script src="http://www.cssass.com/public/js/extend.js"></script>
    <script src="http://www.cssass.com/public/js/litewin.js"></script>
    <title>Baymax</title>
    <style>
        *{ margin:0; padding:0;}
        body{ background:#999;overflow:hidden;}
        .Baymax{width:300px; height:460px; margin:20px auto auto auto;  position:relative; }
        .headWrap{ position:absolute; left:0; width:500px;left:-100px; z-index:100; }
        .head{position:relative;left:200px;width:100px; height:75px; border-radius:50%; background:#FFF; box-shadow:0 5px 5px #888888, 5px 5px 6px #ccc inset;}
        .eyes-l{width:15px; height:15px; border-radius:50%; background:#000; position:absolute; left:20px; top:35px;}
        .eyes-r{width:15px; height:15px; border-radius:50%; background:#000; position:absolute; right:20px; top:35px;}
        .mourse{width:30px; height:3px;  position:absolute; top:42px; left:35px; border-radius:50%;box-shadow: 0px 1px 0px #000;}


        .body{ width:214px; height:320px; left:50%; transform:translate(-50%,0);-webkit-transform:translate(-50%,0); position:absolute;border-radius:45% 45% 50% 50%; top:55px; background:#FFF; z-index:99; box-shadow: 6px 0px 6px #CCC inset,-6px 0px 6px #ccc inset;}
        .belly{width:224px; height:264px; border-radius:42% 42% 50% 50%; position:absolute; bottom:0; left:50%; transform:translate(-50%,0);-webkit-transform:translate(-50%,0); background:#fff;box-shadow:0 3px 2px #888888, 0 -49px 26px #ccc inset;}
        .belly:before{width:15px; height:120px; position:absolute; left:0; content:" "; top:45px; border-radius:50% 20% 20% 50%;box-shadow: 4px 0px 6px #ccc inset; transform:rotate(3deg);-webkit-transform:rotate(3deg);}
        .belly:after{width:15px; height:120px; position:absolute; right:0; content:" "; top:45px; border-radius:20% 50% 50% 20%;box-shadow: -4px 0px 6px #ccc inset; transform:rotate(-3deg);-webkit-transform:rotate(-3deg);}


        .leg-l{width:80px; height:145px; position:absolute; left:70px; top:290px; background:#fff;border-radius:40% 30% 24px 55%; box-shadow: -2px 0px 5px #999 inset, 10px 0px 20px #CCC inset, -10px 0px 20px #CCC inset; }
        .leg-r{width:80px; height:145px; position:absolute; right:70px; top:290px; background:#fff;border-radius:30% 40% 55% 24px;box-shadow: 2px 0 5px #999 inset, 10px 0 20px #ccc inset, -10px 0 20px #ccc inset }

        .hand-l{width:78px; height:224px; position:absolute; left:20px; top:75px; background:#fff; border-radius:50%; transform:rotate(16deg);-webkit-transform:rotate(16deg); box-shadow:6px 6px 6px #ccc inset; z-index:91;}
        .hl-l{width:50px; height:100px; background:#fff; position:absolute; top:160px; border-radius:50% 50% 40% 40%;transform:rotate(-20deg);-webkit-transform:rotate(-20deg); left:15px;}
        .hl-l:before{ content:""; width:15px; height:82px;box-shadow: 4px 0px 6px #ccc inset; transform:rotate(-0deg); -webkit-transform:rotate(-0deg);position:absolute; left:0; top:10px;border-radius:50% 20% 20% 50%;}
        .f-1{width: 14px;height: 30px;background: #fff;position: absolute;bottom: -40px;left: 65px;transform: rotate(-35deg);-webkit-transform: rotate(-35deg);border-radius: 50% 50% 40%;box-shadow: 0px -4px 2px #ccc inset;z-index: 90;}
        .f-2{width: 14px;height: 40px;background: #fff;position: absolute;bottom: -55px;left: 50px;transform: rotate(-45deg);-webkit-transform: rotate(-45deg);border-radius: 50% 50% 40%;box-shadow: 0px -4px 2px #ccc inset;z-index: 90;}
        .f-3{width: 14px;height: 40px;background: #fff;position: absolute;bottom: -62px;left: 49px;transform: rotate(-45deg);-webkit-transform: rotate(-45deg);border-radius: 50% 50% 40%;box-shadow: 0px -4px 2px #ccc inset;z-index: 89;}

        .hand-r{width:78px; height:224px; position:absolute; right:20px; top:75px; background:#fff; border-radius:50%; transform:rotate(-16deg); -webkit-transform:rotate(-16deg);box-shadow:-6px -6px 6px #ccc inset; z-index:91;}
        .hr-r{width:50px; height:100px; background:#fff; position:absolute; top:160px; border-radius:50% 50% 40% 40%;transform:rotate(20deg);-webkit-transform:rotate(20deg); right:15px;}
        .hr-r:before{ content:""; width:15px; height:82px;box-shadow: -4px 0px 6px #ccc inset; transform:rotate(-0deg);-webkit-transform:rotate(-0deg); position:absolute; right:0; top:10px;border-radius:20% 50% 50% 20%;}
        .fr-1{width: 14px;height: 30px;background: #fff;position: absolute;bottom: -40px;right: 65px;transform: rotate(35deg);-webkit-transform: rotate(35deg);border-radius: 50% 50% 40%;box-shadow: 0px -4px 2px #ccc inset;z-index: 90;}
        .fr-2{width: 14px;height: 40px;background: #fff;position: absolute;bottom: -55px;right: 50px;transform: rotate(45deg);-webkit-transform: rotate(35deg);border-radius: 50% 50% 40%;box-shadow: 0px -4px 2px #ccc inset;z-index: 90;}
        .fr-3{width: 14px;height: 40px;background: #fff;position: absolute;bottom: -62px;right: 49px;transform: rotate(45deg);-webkit-transform: rotate(35deg);border-radius: 50% 50% 40%;box-shadow: 0px -4px 2px #ccc inset;z-index: 89;}

        .cover-s{width:64px;  height:15px; position:absolute; left:50%; transform:translate(-50%,0);-webkit-transform:translate(-50%,0); top:19px; z-index:101;}
        .cover-x{width:64px; height:12px; position:absolute; left:50%; transform:translate(-50%,0);-webkit-transform:translate(-50%,0); bottom:12px; z-index:101; overflow:hidden;}
        .left{width:17px; height:15px; float:left; background:#fff;}
        .right{width:17px; height:15px; float:right; background:#fff;}


        .heart{width:50px; height:50px; border-radius:50%; position:absolute; box-shadow:4px 4px 4px #eee inset; right:30px; top:60px; z-index:111; border:3px solid #eee;text-align:center;overflow:hidden;line-height:50px;color:#ccc;-webkit-transform: scale(0.6);transform: scale(0.6);}

        @keyframes myfirst
        {
            0% {transform:rotate(0deg);}
            25% {transform:rotate(6deg);}
            50%{transform:rotate(0deg);}
            75%{transform:rotate(-6deg);}
        100{transform:rotate(0deg);}
        }

        @-webkit-keyframes myfirst
        {
            0% {-webkit-transform:rotate(0deg);}
            25% {-webkit-transform:rotate(10deg);}
            50%{-webkit-transform:rotate(0deg);}
            75%{-webkit-transform:rotate(-10deg);}
        100{-webkit-transform:rotate(0deg);}
        }

        .headWrap{
            animation: myfirst 10s infinite;
            -webkit-animation: myfirst 30s infinite;
        }

        @keyframes eyeclose1
        {
            0% {top:19px;}
            10% {top:28px;}
            20%{top:19px;}
            20%{top:28px;}
            40%{top:19px;}
        }

        @-webkit-keyframes eyeclose1
        {
            0% {top:19px;}
            5% {top:27px;}
            10%{top:19px;}
            15%{top:27px;}
            20%{top:19px;}
        }

        .cover-s{
            animation: eyeclose1 3s infinite 2s;
            -webkit-animation: eyeclose1 3s infinite 2s;
        }

        @keyframes eyeclose2
        {
            0% {bottom:12px;}
            10% {bottom:20px;}
            20%{bottom:12px;}
            20%{bottom:20px;}
            40%{bottom:12px;}
        }

        @-webkit-keyframes eyeclose2
        {
            0% {bottom:12px;}
            5% {bottom:20px;}
            10%{bottom:12px;}
            15%{bottom:20px;}
            20%{bottom:12px;}
        }

        .cover-x{
            animation: eyeclose2 3s infinite 2s;
            -webkit-animation: eyeclose2 3s infinite 2s;
        }

        @keyframes  move-l
        {
            0% {height:145px;}
            25%{height:135px;}
            50%{height:145px;}
            75%{height:155px;}
            100%{height:145px;}
        }

        @-webkit-keyframes  move-l
        {
            0% {height:145px;}
            25%{height:135px;}
            50%{height:145px;}
            75%{height:155px;}
            100%{height:145px;}
        }

        .leg-wrap:hover .leg-l,
        .leg-wrap:active .leg-l{
            animation: move-l 3s infinite  0.1s;
            -webkit-animation:  move-l 3s infinite  0.1s;
        }

        @keyframes  move-r
        {
            0% {height:145px;}
            25%{height:155px;}
            50%{height:145px;}
            75%{height:135px;}
            100%{height:145px;}
        }

        @-webkit-keyframes  move-r
        {
            0% {height:145px;}
            25%{height:155px;}
            50%{height:145px;}
            75%{height:135px;}
            100%{height:145px;}
        }

        .leg-wrap:hover .leg-r,
        .leg-wrap:active .leg-r{
            animation: move-r 3s infinite 0.1s;
            -webkit-animation:  move-r 3s infinite 0.1s;
        }

        .hand-l,.hand-r,.leg-l,.leg-r{
            -webkit-transition:all 1s ease-in-out 0;
            transition:all 1s ease-in-out 0s;
        }

        .hand-l:hover,
        .hand-l:active,
        .body-wrap:hover .hand-l,
        .body-wrap:active .hand-l{
            left:10px;
            top:30px;
            transform: rotate(50deg);
            -webkit-transform: rotate(50deg);
        }
        .hand-r:hover,
        .hand-r:active,
        .body-wrap:hover .hand-r,
        .body-wrap:active .hand-r{
            right:10px;
            top:30px;
            transform: rotate(-50deg);
            -webkit-transform: rotate(-50deg);
        }

        .talkwrap{position:absolute;top:-15px;z-index:101;left:280px;display:none;}
        .headWrap:hover .talkwrap,.headWrap:active .talkwrap{display:block;}
        .talkwrap:after{content:" ";display:block;clear:both;}
        .bd{
            background:#fff;float:left;padding:10px;position:relative;z-index:2;
            box-shadow: 5px 8px 11px rgba(0,0,0,0.4);
            border-radius: 5px;
        }
        .cor{
            position:absolute;
            z-index:2;
            width:15px;
            height:15px;
            background:#fff;
            left:10px;
            bottom:-6px;
            transform: skewY(-45deg);
            -webkit-transform: skewY(-45deg);
        }
        .cor_s{
            z-index:1;
            box-shadow: 5px 8px 11px rgba(0,0,0,0.4);
        }

    </style>
</head>
<body>
<div class="Baymax">
    <div class="headWrap">
        <div class="head">
            <div class="cover-s"><div class="left"></div><div class="right"></div></div>
            <div class="cover-x"><div class="left"></div><div class="right"></div></div>
            <div class="eyes-l"></div>
            <div class="eyes-r"></div>
            <div class="mourse"></div>
        </div>
        <div class='talkwrap'>
            <div class='bd' id="talkBox">Hello, I am Baymax.</div>
            <div class="cor"></div>
            <div class="cor cor_s"></div>
        </div>
    </div>
    <div class="body-wrap">
        <div class="hand-wrap">
            <div class="hand-l">
                <div class="hl-l"></div>
                <div class="f-1"></div>
                <div class="f-2"></div>
                <div class="f-3"></div>
            </div>
            <div class="hand-r">
                <div class="hr-r"></div>
                <div class="fr-1"></div>
                <div class="fr-2"></div>
                <div class="fr-3"></div>
            </div>
        </div>
        <div class="body">
            <div class="heart">_/￣\_</div>
            <div class="belly"></div>
        </div>
    </div>
    <div class="leg-wrap">
        <div class="leg-l"></div>
        <div class="leg-r"></div>
    </div>
</div>
</body>
</html>