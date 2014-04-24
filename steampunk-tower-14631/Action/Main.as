package 
{
    import com.greensock.*;
    import flash.display.*;
    import flash.events.*;
    import flash.geom.*;
    import flash.net.*;
    import flash.text.*;
    import flash.utils.*;

    public class Main extends MovieClip
    {
        public var progressBars:MovieClip;
        public var mcCongr:MovieClip;
        public var btMenu:SimpleButton;
        public var btSubmit:SimpleButton;
        public var txtSitelock:TextField;
        public var levelContainer:MovieClip;
        public var btPlay:SimpleButton;
        public var txtTotal:TextField;
        public var mainMenu:MainMenu;
        public var logoAll:MovieClip;
        public var txtMainInfo:TextField;
        public var btMenu2:SimpleButton;
        public var txtFps:TextField;
        public var AGteaser:MovieClip;
        public var loadState:int;
        public var frmRate:int;
        public var splashOut:MovieClip;
        public var spOut:MovieClip;
        public var t:Timer;
        public var fps:int;
        public var spOut2:MovieClip;
        public var flag:Boolean = false;
        public static var totalLevels:int = 15;
        public static var rastFactory:RastFactory;
        public static var main:Main;

        public function Main()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 2, this.frame3, 3, this.frame4, 4, this.frame5, 5, this.frame6, 6, this.frame7, 7, this.frame8, 8, this.frame9);
            Main.main = this;
            return;
        }// end function

        public function isUrl(param1:Array) : Boolean
        {
            var _loc_2:* = stage.loaderInfo.loaderURL;
            var _loc_3:* = _loc_2.indexOf("://") + 3;
            var _loc_4:* = _loc_2.indexOf("/", _loc_3);
            var _loc_5:* = _loc_2.substring(_loc_3, _loc_4);
            var _loc_6:* = _loc_2.substring(_loc_3, _loc_4).lastIndexOf(".") - 1;
            var _loc_7:* = _loc_5.lastIndexOf(".", _loc_6) + 1;
            _loc_5 = _loc_5.substring(_loc_7, _loc_5.length);
            var _loc_8:int = 0;
            while (_loc_8 < param1.length)
            {
                
                if (_loc_5 == param1[_loc_8])
                {
                    return true;
                }
                _loc_8++;
            }
            return false;
        }// end function

        public function isUrl1(param1:Array) : Boolean
        {
            var _loc_2:* = stage.loaderInfo.loaderURL;
            var _loc_3:* = _loc_2.indexOf("://") + 3;
            var _loc_4:* = _loc_2.indexOf("/", _loc_3);
            var _loc_5:* = _loc_2.substring(_loc_3, _loc_4);
            var _loc_6:* = _loc_2.substring(_loc_3, _loc_4).lastIndexOf(".") - 1;
            var _loc_7:* = _loc_5.lastIndexOf(".", _loc_6) + 1;
            _loc_5 = _loc_5.substring(_loc_7, _loc_5.length);
            var _loc_8:int = 0;
            while (_loc_8 < param1.length)
            {
                
                if (_loc_5 == param1[_loc_8])
                {
                    return true;
                }
                _loc_8++;
            }
            return false;
        }// end function

        public function initMain(event:Event) : void
        {
            removeEventListener(Event.ADDED_TO_STAGE, this.initMain);
            this.initialize();
            play();
            stage.scaleMode = StageScaleMode.NO_SCALE;
            stage.showDefaultContextMenu = false;
            return;
        }// end function

        public function isUrl2(param1:Array) : Boolean
        {
            var _loc_2:* = stage.loaderInfo.loaderURL;
            var _loc_3:* = _loc_2.indexOf("://") + 3;
            var _loc_4:* = _loc_2.indexOf("/", _loc_3);
            var _loc_5:* = _loc_2.substring(_loc_3, _loc_4);
            var _loc_6:* = _loc_2.substring(_loc_3, _loc_4).lastIndexOf(".") - 1;
            var _loc_7:* = _loc_5.lastIndexOf(".", _loc_6) + 1;
            _loc_5 = _loc_5.substring(_loc_7, _loc_5.length);
            var _loc_8:int = 0;
            while (_loc_8 < param1.length)
            {
                
                if (_loc_5 == param1[_loc_8])
                {
                    return true;
                }
                _loc_8++;
            }
            return false;
        }// end function

        public function btPlayClick(event:MouseEvent) : void
        {
            this.btPlay.removeEventListener(MouseEvent.CLICK, this.btPlayClick);
            var _loc_2:* = new SplashIn();
            stage.addChild(_loc_2);
            TweenLite.delayedCall(_loc_2.totalFrames, gotoAndStop, ["splash"], true);
            return;
        }// end function

        public function update(event:Event) : void
        {
            var _loc_2:Number = NaN;
            var _loc_3:Number = NaN;
            var _loc_4:int = 0;
            var _loc_5:Number = NaN;
            var _loc_6:int = 0;
            if (this.loadState == 1)
            {
                _loc_2 = loaderInfo.bytesLoaded;
                _loc_3 = loaderInfo.bytesTotal;
                _loc_4 = 0;
                if (_loc_3 > 0)
                {
                    _loc_4 = Math.floor(_loc_2 / _loc_3 * 100);
                }
                this.progressBars.gotoAndStop(_loc_4);
                if (_loc_2 >= _loc_3 || _loc_3 == 0)
                {
                    if (this.flag == false)
                    {
                        this.flag = true;
                        gotoAndStop("stuff");
                        stage.frameRate = this.frmRate;
                        return;
                    }
                    this.loadState = 2;
                    this.rasterize();
                    CannonInfo.initialize();
                    stage.frameRate = 200;
                }
            }
            else if (this.loadState == 2)
            {
                _loc_5 = Main.rastFactory.getProgress();
                _loc_6 = 100 + _loc_5 * 100;
                this.progressBars.gotoAndStop(_loc_6);
                if (_loc_5 >= 1)
                {
                    stage.frameRate = this.frmRate;
                    removeEventListener(Event.ENTER_FRAME, this.update);
                    this.btPlay.alpha = 0;
                    this.btPlayClick(null);
                }
            }
            return;
        }// end function

        public function isUrl3(param1:Array) : Boolean
        {
            var _loc_2:* = stage.loaderInfo.loaderURL;
            var _loc_3:* = _loc_2.indexOf("://") + 3;
            var _loc_4:* = _loc_2.indexOf("/", _loc_3);
            var _loc_5:* = _loc_2.substring(_loc_3, _loc_4);
            var _loc_6:* = _loc_2.substring(_loc_3, _loc_4).lastIndexOf(".") - 1;
            var _loc_7:* = _loc_5.lastIndexOf(".", _loc_6) + 1;
            _loc_5 = _loc_5.substring(_loc_7, _loc_5.length);
            var _loc_8:int = 0;
            while (_loc_8 < param1.length)
            {
                
                if (_loc_5 == param1[_loc_8])
                {
                    return true;
                }
                _loc_8++;
            }
            return false;
        }// end function

        public function initDgTeaser() : void
        {
            var _loc_1:* = new SplashIn();
            stage.addChild(_loc_1);
            TweenLite.delayedCall(_loc_1.totalFrames, this.initDgTeaser2, null, true);
            return;
        }// end function

        public function initDgTeaser2() : void
        {
            this.logoAll.visible = true;
            this.AGteaser.stop();
            this.AGteaser.visible = false;
            this.AGteaser.removeEventListener(MouseEvent.CLICK, this.goMoreGames);
            this.logoAll.logoAnim.play();
            TweenLite.delayedCall(this.logoAll.logoAnim.totalFrames, this.initNext, null, true);
            return;
        }// end function

        public function initNext(event:MouseEvent = null) : void
        {
            this.logoAll.removeEventListener(MouseEvent.CLICK, this.initNext);
            TweenLite.killDelayedCallsTo(this.initNext);
            var _loc_2:* = new SplashIn();
            stage.addChild(_loc_2);
            TweenLite.delayedCall(_loc_2.totalFrames, gotoAndStop, ["main menu"], true);
            return;
        }// end function

        public function isUrl4(param1:Array) : Boolean
        {
            var _loc_2:* = stage.loaderInfo.loaderURL;
            var _loc_3:* = _loc_2.indexOf("://") + 3;
            var _loc_4:* = _loc_2.indexOf("/", _loc_3);
            var _loc_5:* = _loc_2.substring(_loc_3, _loc_4);
            var _loc_6:* = _loc_2.substring(_loc_3, _loc_4).lastIndexOf(".") - 1;
            var _loc_7:* = _loc_5.lastIndexOf(".", _loc_6) + 1;
            _loc_5 = _loc_5.substring(_loc_7, _loc_5.length);
            var _loc_8:int = 0;
            while (_loc_8 < param1.length)
            {
                
                if (_loc_5 == param1[_loc_8])
                {
                    return true;
                }
                _loc_8++;
            }
            return false;
        }// end function

        public function isUrl5(param1:Array) : Boolean
        {
            var _loc_2:* = stage.loaderInfo.loaderURL;
            var _loc_3:* = _loc_2.indexOf("://") + 3;
            var _loc_4:* = _loc_2.indexOf("/", _loc_3);
            var _loc_5:* = _loc_2.substring(_loc_3, _loc_4);
            var _loc_6:* = _loc_2.substring(_loc_3, _loc_4).lastIndexOf(".") - 1;
            var _loc_7:* = _loc_5.lastIndexOf(".", _loc_6) + 1;
            _loc_5 = _loc_5.substring(_loc_7, _loc_5.length);
            var _loc_8:int = 0;
            while (_loc_8 < param1.length)
            {
                
                if (_loc_5 == param1[_loc_8])
                {
                    return true;
                }
                _loc_8++;
            }
            return false;
        }// end function

        public function startScroll(event:TimerEvent) : void
        {
            stage.frameRate = 35;
            this.t.removeEventListener(TimerEvent.TIMER_COMPLETE, this.startScroll);
            this.t.addEventListener(TimerEvent.TIMER, this.animCredits);
            this.t.delay = 50;
            this.t.repeatCount = 999999;
            this.t.start();
            this.btMenu.alpha = 0;
            TweenLite.to(this.btMenu, 1, {x:20, alpha:1, delay:5});
            this.btSubmit.alpha = 0;
            this.btSubmit.visible = false;
            return;
        }// end function

        public function animCredits(event:TimerEvent) : void
        {
            this.mcCongr.y = this.mcCongr.y - 2;
            if (this.mcCongr.y <= -this.mcCongr.height + 500)
            {
                this.mcCongr.y = -this.mcCongr.height + 500;
                this.t.removeEventListener(TimerEvent.TIMER, this.animCredits);
                this.t.stop();
            }
            return;
        }// end function

        public function gotoMainMenu(event:MouseEvent) : void
        {
            this.btSubmit.removeEventListener(MouseEvent.CLICK, this.gotoSubmit);
            this.btMenu.removeEventListener(MouseEvent.CLICK, this.gotoMainMenu);
            stage.frameRate = this.fps;
            this.t.removeEventListener(TimerEvent.TIMER, this.animCredits);
            this.t.stop();
            var _loc_2:* = new SplashIn();
            stage.addChild(_loc_2);
            TweenLite.delayedCall(_loc_2.totalFrames, gotoAndStop, ["main menu"], true);
            return;
        }// end function

        public function gotoSubmit(event:MouseEvent) : void
        {
            this.btSubmit.removeEventListener(MouseEvent.CLICK, this.gotoSubmit);
            this.btMenu.removeEventListener(MouseEvent.CLICK, this.gotoMainMenu);
            stage.frameRate = this.fps;
            this.t.removeEventListener(TimerEvent.TIMER, this.animCredits);
            this.t.stop();
            var _loc_2:* = new SplashIn();
            stage.addChild(_loc_2);
            TweenLite.delayedCall(_loc_2.totalFrames, Main.main.gotoAndStop, ["submit"], true);
            return;
        }// end function

        public function gotoMainMenu2(event:MouseEvent) : void
        {
            this.btMenu2.removeEventListener(MouseEvent.CLICK, this.gotoMainMenu2);
            var _loc_2:* = new SplashIn();
            stage.addChild(_loc_2);
            TweenLite.delayedCall(_loc_2.totalFrames, gotoAndStop, ["main menu"], true);
            MainMenu.fromGame = true;
            MainMenu.showUpgrades = true;
            return;
        }// end function

        public function initialize(event:Event = null) : void
        {
            Input.initialize(stage);
            FpsCounter.initialize(stage);
            SoundManager.initialize(stage);
            Upgrades.initialize();
            Saves.load();
            stage.addEventListener(KeyboardEvent.KEY_UP, this.keyUpHandler);
            rastFactory = new RastFactory();
            var _loc_2:* = transform.colorTransform;
            _loc_2.redMultiplier = 1.1;
            _loc_2.greenMultiplier = 1.1;
            _loc_2.blueMultiplier = 1.1;
            transform.colorTransform = _loc_2;
            return;
        }// end function

        public function goMoreGames(event:MouseEvent = null) : void
        {
            navigateToURL(new URLRequest("http://armor.ag/MoreGames"), "_blank");
            return;
        }// end function

        private function keyUpHandler(event:KeyboardEvent) : void
        {
            if (event.keyCode == 81)
            {
                this.changeQuality();
            }
            return;
        }// end function

        public function changeQuality(param1:String = null)
        {
            if (!param1)
            {
                if (stage.quality == "HIGH")
                {
                    stage.quality = "MEDIUM";
                }
                else if (stage.quality == "MEDIUM")
                {
                    stage.quality = "LOW";
                }
                else
                {
                    stage.quality = "HIGH";
                }
            }
            else
            {
                stage.quality = param1;
            }
            return;
        }// end function

        public function rasterize() : void
        {
            Airplane.initCoords();
            rastFactory.addMovieClip(new podval_par1(), "podval_par1");
            rastFactory.addMovieClip(new podval_par2(), "podval_par2");
            rastFactory.addMovieClip(new Explode(), "Explode");
            rastFactory.addMovieClip(new Explode2(), "Explode2");
            rastFactory.addMovieClip(new Ricoshet1(), "Ricoshet1");
            rastFactory.addMovieClip(new Ricoshet1Small(), "Ricoshet1Small");
            rastFactory.addMovieClip(new Ricoshet2(), "Ricoshet2");
            rastFactory.addMovieClip(new Ricoshet2Big(), "Ricoshet2Big");
            rastFactory.addMovieClip(new Ricoshet3(), "Ricoshet3");
            rastFactory.addMovieClip(new Splash(), "Splash");
            rastFactory.addMovieClip(new ParBreakrAnim(), "ParBreakrAnim");
            rastFactory.addMovieClip(new EyeFlow(), "EyeFlow");
            rastFactory.addMovieClip(new Explode2Big(), "Explode2Big");
            rastFactory.addMovieClip(new RicoshetElectro(), "RicoshetElectro");
            rastFactory.addMovieClip(new FireBalloon(), "FireBalloon-right");
            rastFactory.addMovieClip(new FireTanket(), "FireTanket-right");
            rastFactory.addMovieClip(new FireAerostat(), "FireAerostat-right");
            rastFactory.addMovieClip(new FireAirplane(), "FireAirplane-right");
            rastFactory.addMovieClip(new FireAirship(), "FireAirship-right");
            rastFactory.addMovieClip(new FireCar(), "FireCar-right");
            rastFactory.addMovieClip(new FireHeli(), "FireHeli-right");
            rastFactory.addMovieClip(new FireTank(), "FireTank-right");
            rastFactory.addMovieClip(new FireTank2(), "FireTank2-right");
            rastFactory.addMovieClip(new FireTankBig(), "FireTankBig-right");
            rastFactory.addMovieClip(new FireTankBig2(), "FireTankBig2-right");
            rastFactory.addMovieClip(new FireUnit1(), "FireUnit1-right");
            rastFactory.addMovieClip(new FireUnit2(), "FireUnit2-right");
            rastFactory.addMovieClip(new FireWalker(), "FireWalker-right");
            rastFactory.addMovieClip(new FireWalker2(), "FireWalker2-right");
            rastFactory.addMovieClip(new FireWheel(), "FireWheel-right");
            this.addEffectLeft(new FireBalloon(), "FireBalloon-left");
            this.addEffectLeft(new FireTanket(), "FireTanket-left");
            this.addEffectLeft(new FireAerostat(), "FireAerostat-left");
            this.addEffectLeft(new FireAirplane(), "FireAirplane-left");
            this.addEffectLeft(new FireAirship(), "FireAirship-left");
            this.addEffectLeft(new FireCar(), "FireCar-left");
            this.addEffectLeft(new FireHeli(), "FireHeli-left");
            this.addEffectLeft(new FireTank(), "FireTank-left");
            this.addEffectLeft(new FireTank2(), "FireTank2-left");
            this.addEffectLeft(new FireTankBig(), "FireTankBig-left");
            this.addEffectLeft(new FireTankBig2(), "FireTankBig2-left");
            this.addEffectLeft(new FireUnit1(), "FireUnit1-left");
            this.addEffectLeft(new FireUnit2(), "FireUnit2-left");
            this.addEffectLeft(new FireWalker(), "FireWalker-left");
            this.addEffectLeft(new FireWalker2(), "FireWalker2-left");
            this.addEffectLeft(new FireWheel(), "FireWheel-left");
            rastFactory.addMovieClip(new ShockBalloon(), "ShockBalloon-right");
            rastFactory.addMovieClip(new ShockTanket(), "ShockTanket-right");
            rastFactory.addMovieClip(new ShockAerostat(), "ShockAerostat-right");
            rastFactory.addMovieClip(new ShockAirplane(), "ShockAirplane-right");
            rastFactory.addMovieClip(new ShockAirship(), "ShockAirship-right");
            rastFactory.addMovieClip(new ShockCar(), "ShockCar-right");
            rastFactory.addMovieClip(new ShockHeli(), "ShockHeli-right");
            rastFactory.addMovieClip(new ShockTank(), "ShockTank-right");
            rastFactory.addMovieClip(new ShockTank2(), "ShockTank2-right");
            rastFactory.addMovieClip(new ShockTankBig(), "ShockTankBig-right");
            rastFactory.addMovieClip(new ShockTankBig2(), "ShockTankBig2-right");
            rastFactory.addMovieClip(new ShockUnit1(), "ShockUnit1-right");
            rastFactory.addMovieClip(new ShockUnit2(), "ShockUnit2-right");
            rastFactory.addMovieClip(new ShockWalker(), "ShockWalker-right");
            rastFactory.addMovieClip(new ShockWalker2(), "ShockWalker2-right");
            rastFactory.addMovieClip(new ShockWheel(), "ShockWheel-right");
            this.addEffectLeft(new ShockBalloon(), "ShockBalloon-left");
            this.addEffectLeft(new ShockTanket(), "ShockTanket-left");
            this.addEffectLeft(new ShockAerostat(), "ShockAerostat-left");
            this.addEffectLeft(new ShockAirplane(), "ShockAirplane-left");
            this.addEffectLeft(new ShockAirship(), "ShockAirship-left");
            this.addEffectLeft(new ShockCar(), "ShockCar-left");
            this.addEffectLeft(new ShockHeli(), "ShockHeli-left");
            this.addEffectLeft(new ShockTank(), "ShockTank-left");
            this.addEffectLeft(new ShockTank2(), "ShockTank2-left");
            this.addEffectLeft(new ShockTankBig(), "ShockTankBig-left");
            this.addEffectLeft(new ShockTankBig2(), "ShockTankBig2-left");
            this.addEffectLeft(new ShockUnit1(), "ShockUnit1-left");
            this.addEffectLeft(new ShockUnit2(), "ShockUnit2-left");
            this.addEffectLeft(new ShockWalker(), "ShockWalker-left");
            this.addEffectLeft(new ShockWalker2(), "ShockWalker2-left");
            this.addEffectLeft(new ShockWheel(), "ShockWheel-left");
            this.addEnemyRight(new BalloonMc(), "BalloonMc-right");
            this.addEnemyRight(new TanketMc(), "TanketMc-right");
            this.addEnemyRight(new ParashutistMC(), "ParashutistMC-right");
            this.addEnemyRight(new AerostatMc(), "AerostatMc-right");
            this.addEnemyRight(new AirplaneMc(), "AirplaneMc-right");
            this.addEnemyRight(new AirshipMc(), "AirshipMc-right");
            this.addEnemyRight(new CarMc(), "CarMc-right");
            this.addEnemyRight(new HelicopterMc(), "HelicopterMc-right");
            this.addEnemyRight(new Tank1Mc(), "Tank1Mc-right");
            this.addEnemyRight(new Tank2Mc(), "Tank2Mc-right");
            this.addEnemyRight(new Tank3Mc(), "Tank3Mc-right");
            this.addEnemyRight(new Tank4Mc(), "Tank4Mc-right");
            this.addEnemyRight(new Unit1Mc(), "Unit1Mc-right");
            this.addEnemyRight(new Unit2Mc(), "Unit2Mc-right");
            this.addEnemyRight(new Walker1Mc(), "Walker1Mc-right");
            this.addEnemyRight(new Walker2Mc(), "Walker2Mc-right");
            this.addEnemyRight(new WheelMc(), "WheelMc-right");
            this.addEnemyLeft(new BalloonMc(), "BalloonMc-left");
            this.addEnemyLeft(new TanketMc(), "TanketMc-left");
            this.addEnemyLeft(new ParashutistMC(), "ParashutistMC-left");
            this.addEnemyLeft(new AerostatMc(), "AerostatMc-left");
            this.addEnemyLeft(new AirplaneMc(), "AirplaneMc-left");
            this.addEnemyLeft(new AirshipMc(), "AirshipMc-left");
            this.addEnemyLeft(new CarMc(), "CarMc-left");
            this.addEnemyLeft(new HelicopterMc(), "HelicopterMc-left");
            this.addEnemyLeft(new Tank1Mc(), "Tank1Mc-left");
            this.addEnemyLeft(new Tank2Mc(), "Tank2Mc-left");
            this.addEnemyLeft(new Tank3Mc(), "Tank3Mc-left");
            this.addEnemyLeft(new Tank4Mc(), "Tank4Mc-left");
            this.addEnemyLeft(new Unit1Mc(), "Unit1Mc-left");
            this.addEnemyLeft(new Unit2Mc(), "Unit2Mc-left");
            this.addEnemyLeft(new Walker1Mc(), "Walker1Mc-left");
            this.addEnemyLeft(new Walker2Mc(), "Walker2Mc-left");
            this.addEnemyLeft(new WheelMc(), "WheelMc-left");
            rastFactory.startRender();
            return;
        }// end function

        private function addEnemyRight(param1:MovieClip, param2:String) : void
        {
            rastFactory.addMovieClip(param1, param2, param1.container.totalFrames);
            return;
        }// end function

        private function addEnemyLeft(param1:MovieClip, param2:String) : void
        {
            param1.container.scaleX = param1.container.scaleX * -1;
            param1.container.x = param1.container.x * -1;
            rastFactory.addMovieClip(param1, param2, param1.container.totalFrames);
            return;
        }// end function

        private function addEffectLeft(param1:MovieClip, param2:String) : void
        {
            var _loc_3:* = param1.getChildAt(0) as MovieClip;
            _loc_3.scaleX = _loc_3.scaleX * -1;
            _loc_3.x = _loc_3.x * -1;
            rastFactory.addMovieClip(param1, param2, param1.totalFrames);
            return;
        }// end function

        function frame1()
        {
            tabChildren = false;
            stage.scaleMode = StageScaleMode.NO_SCALE;
            stage.showDefaultContextMenu = false;
            if (!this.isUrl(["dg-company.com", "games.armorgames.com", "armorgames.com", "preview.armorgames.com", "cache.armorgames.com", "cdn.armorgames.com", "gamemedia.armorgames.com", "games.armorgames.com"]))
            {
                this.txtSitelock.visible = true;
                gotoAndStop(1);
                return;
            }
            play();
            this.txtSitelock.visible = false;
            return;
        }// end function

        function frame2()
        {
            if (!this.isUrl1(["dg-company.com", "games.armorgames.com", "armorgames.com", "preview.armorgames.com", "cache.armorgames.com", "cdn.armorgames.com", "gamemedia.armorgames.com", "games.armorgames.com"]))
            {
                gotoAndStop(1);
                return;
            }
            this.txtMainInfo.text = "stage = " + stage.toString();
            if (stage == null)
            {
                stop();
                addEventListener(Event.ADDED_TO_STAGE, this.initMain);
            }
            else
            {
                this.initMain(null);
            }
            return;
        }// end function

        function frame3()
        {
            if (!this.isUrl2(["dg-company.com", "games.armorgames.com", "armorgames.com", "preview.armorgames.com", "cache.armorgames.com", "cdn.armorgames.com", "gamemedia.armorgames.com", "games.armorgames.com"]))
            {
                gotoAndStop(1);
                return;
            }
            this.loadState = 1;
            stop();
            this.frmRate = stage.frameRate;
            addEventListener(Event.ENTER_FRAME, this.update);
            this.btPlay.visible = false;
            this.btPlay.addEventListener(MouseEvent.CLICK, this.btPlayClick);
            return;
        }// end function

        function frame4()
        {
            gotoAndStop("preloader");
            return;
        }// end function

        function frame5()
        {
            if (!this.isUrl3(["dg-company.com", "games.armorgames.com", "armorgames.com", "preview.armorgames.com", "cache.armorgames.com", "cdn.armorgames.com", "gamemedia.armorgames.com", "games.armorgames.com"]))
            {
                gotoAndStop(1);
                return;
            }
            this.logoAll.visible = false;
            this.AGteaser.addEventListener(MouseEvent.CLICK, this.goMoreGames);
            this.splashOut = new SplashOut();
            stage.addChild(this.splashOut);
            this.logoAll.logoAnim.stop();
            TweenLite.delayedCall(this.AGteaser.totalFrames, this.initDgTeaser2, null, true);
            this.logoAll.addEventListener(MouseEvent.CLICK, this.initNext);
            return;
        }// end function

        function frame6()
        {
            if (!this.isUrl4(["dg-company.com", "games.armorgames.com", "armorgames.com", "preview.armorgames.com", "cache.armorgames.com", "cdn.armorgames.com", "gamemedia.armorgames.com", "games.armorgames.com"]))
            {
                gotoAndStop(1);
                return;
            }
            stop();
            stage.quality = StageQuality.HIGH;
            this.mainMenu.initialize();
            return;
        }// end function

        function frame7()
        {
            if (!this.isUrl5(["dg-company.com", "games.armorgames.com", "armorgames.com", "preview.armorgames.com", "cache.armorgames.com", "cdn.armorgames.com", "gamemedia.armorgames.com", "games.armorgames.com"]))
            {
                gotoAndStop(1);
                return;
            }
            stop();
            this.levelContainer.level.initialize();
            return;
        }// end function

        function frame8()
        {
            this.spOut = new SplashOut();
            stage.addChild(this.spOut);
            this.t = new Timer(3000, 1);
            this.t.addEventListener(TimerEvent.TIMER_COMPLETE, this.startScroll);
            this.t.start();
            this.fps = stage.frameRate;
            this.btMenu.addEventListener(MouseEvent.CLICK, this.gotoMainMenu, false, 0, true);
            this.btSubmit.addEventListener(MouseEvent.CLICK, this.gotoSubmit, false, 0, true);
            return;
        }// end function

        function frame9()
        {
            stop();
            this.spOut2 = new SplashOut();
            stage.addChild(this.spOut2);
            this.txtTotal.text = Saves.curSaves.totalScore().toString();
            this.btMenu2.addEventListener(MouseEvent.CLICK, this.gotoMainMenu2, false, 0, true);
            return;
        }// end function

    }
}
