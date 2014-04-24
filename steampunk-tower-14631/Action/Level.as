package 
{
    import __AS3__.vec.*;
    import com.greensock.*;
    import flash.display.*;
    import flash.events.*;
    import flash.geom.*;
    import flash.text.*;
    import flash.ui.*;
    import flash.utils.*;

    public class Level extends MovieClip
    {
        public var agButton_btn:MovieClip;
        public var upLeftPanel:MovieClip;
        public var mcCannonDistanceLeft:MovieClip;
        public var allHints:AllHintsAni;
        public var upRightPanel:MovieClip;
        public var c1:MovieClip;
        public var mcEnemySelect:MovieClip;
        public var plashka:MovieClip;
        public var mcBottomMenu:BottomMenu;
        public var eyeEff:StaemLaserEffect;
        public var txtLevel:TextField;
        public var mcTower:Tower;
        public var mcBottomMenuUpgrade:BottomUpgradeMenu;
        public var landscape:game_bg;
        public var cannonInfoPanelBigMC:MovieClip;
        public var mcCannonDistanceRight:MovieClip;
        public var mcEnemiesPlace:MovieClip;
        public var state:int = 0;
        public var health:Number = 350;
        public var scores:int = 0;
        public var experience:int = 0;
        public var money:int = 100000;
        public var initMoney:int = 100000;
        public var tower:Tower;
        private var enLayerIndex:int = 0;
        public var enemies:Vector.<Enemy>;
        public var bullets:Vector.<Bullet>;
        public var effects:Vector.<RastrMovieClip>;
        private var lastTime:Number = 0;
        public var canvas:Sprite;
        public var levelManager:LevelManager;
        public var bottomMenu:BottomMenu;
        public var bottomMenuUpgr:BottomUpgradeMenu;
        public var bitmap:Bitmap;
        public var unitInfoPanel:MovieClip;
        private var unitInfoEnemy:Enemy;
        private var cannonInfo:Cannon;
        public var cannonInfoPanel:MovieClip;
        private var cannonInfoPanelBig:MovieClip;
        public var bigInfoOwner:DisplayObject;
        public var eyeBarPanel:MovieClip;
        private var panelPause:MovieClip;
        private var panelMenu:GameMenu;
        private var panelVictory:MovieClip;
        private var panelDefeat:MovieClip;
        private var achivPanel:Achivements;
        public var helps:HintPanels;
        private var radioGame:RadioGame;
        private var infoBigCannonType:int;
        private var infoBigUpgrInd:int;
        private var infoBigPx:int;
        private var infoBigPy:int;
        private var prevState:int = 0;
        private var encPanel:PanelEnc;
        public var starsCount:int = 0;
        private var fps:int;
        private var totalTimeMs:int = 0;
        public var shakeTime:Number = 0;
        private var shakePower:Number = 2;
        private var unitYs:Array;
        private var unitYCountLeft:Array;
        private var unitYCountRight:Array;
        public static var maxHealth:Number = 350;
        public static var deltaTime:Number = 0;
        public static var gameTime:Number = 0;
        public static var startTime:Number;
        public static var levelIndex:int = 0;
        public static var isChallenge:Boolean = false;
        public static var challengeScore:int = 0;
        public static var autoPause:Boolean = true;

        public function Level()
        {
            this.enemies = new Vector.<Enemy>;
            this.bullets = new Vector.<Bullet>;
            this.effects = new Vector.<RastrMovieClip>;
            this.canvas = new Sprite();
            this.achivPanel = new Achivements();
            this.helps = new HintPanels();
            this.unitYs = [180, 193, 207, 220];
            this.unitYCountLeft = [0, 0, 0, 0];
            this.unitYCountRight = [0, 0, 0, 0];
            return;
        }// end function

        public function initialize() : void
        {
            this.c1.mouseEnabled = false;
            this.c1.mouseChildren = false;
            addChild(this.canvas);
            this.tower = this.mcTower;
            this.tower.initialize(this);
            this.lastTime = getTimer();
            addEventListener(Event.ENTER_FRAME, this.update, false, 0, true);
            this.levelManager = new LevelManager(this);
            setChildIndex(this.canvas, (numChildren - 1));
            this.bitmap = new Bitmap(new BitmapData(800, 500, true, 0));
            this.bitmap.x = -400;
            this.bitmap.y = -250;
            this.enLayerIndex = getChildIndex(this.mcEnemiesPlace);
            addChildAt(this.bitmap, this.enLayerIndex);
            removeChild(this.mcEnemiesPlace);
            this.bottomMenu = getChildByName("mcBottomMenu") as BottomMenu;
            this.bottomMenu.initialize(this);
            setChildIndex(this.bottomMenu, (numChildren - 1));
            this.bottomMenuUpgr = getChildByName("mcBottomMenuUpgrade") as BottomUpgradeMenu;
            this.bottomMenuUpgr.initialize(this);
            setChildIndex(this.bottomMenuUpgr, (numChildren - 1));
            stage.addEventListener(KeyboardEvent.KEY_UP, this.keyUpHandler, false, 0, true);
            stage.addEventListener(Event.DEACTIVATE, this.autoPauseOn, false, 0, true);
            this.panelPause = MovieClip(parent).panelPause;
            this.panelPause.visible = false;
            this.panelPause.x = 0;
            this.panelPause.y = 0;
            this.panelPause.addEventListener(MouseEvent.CLICK, this.pauseOff, false, 0, true);
            this.panelMenu = MovieClip(parent).panelMenu as GameMenu;
            this.panelMenu.visible = false;
            this.panelMenu.x = 0;
            this.panelMenu.y = 0;
            this.panelMenu.initialize(this);
            this.upRightPanel.panel.btPause.addEventListener(MouseEvent.CLICK, this.pauseOn, false, 0, true);
            this.upRightPanel.panel.btEnc.addEventListener(MouseEvent.CLICK, this.btEncClick, false, 0, true);
            this.upRightPanel.panel.btMenu.addEventListener(MouseEvent.CLICK, this.showMenu, false, 0, true);
            this.upRightPanel.panel.btPlus.addEventListener(MouseEvent.CLICK, Main.main.goMoreGames, false, 0, true);
            this.unitInfoPanel = getChildByName("unitInfoPanel") as MovieClip;
            stage.addEventListener(MouseEvent.CLICK, this.showUnitInfo, false, 0, true);
            this.cannonInfoPanelBig = getChildByName("cannonInfoPanelBigMC") as MovieClip;
            this.cannonInfoPanelBig.mouseEnabled = false;
            this.cannonInfoPanelBig.visible = false;
            this.cannonInfoPanel = getChildByName("cannonInfoPanel") as MovieClip;
            this.cannonInfoPanel.x = this.unitInfoPanel.x;
            this.cannonInfoPanel.y = this.unitInfoPanel.y;
            this.cannonInfoPanel.alpha = 0;
            this.unitInfoPanel.alpha = 0;
            this.mcEnemySelect.visible = false;
            this.eyeBarPanel = getChildByName("eyeBarPanel") as MovieClip;
            this.eyeBarPanel.x = this.unitInfoPanel.x;
            this.eyeBarPanel.y = this.unitInfoPanel.y;
            this.eyeBarPanel.visible = false;
            this.eyeBarPanel.mouseEnabled = false;
            this.mcCannonDistanceLeft.visible = false;
            this.mcCannonDistanceRight.visible = false;
            this.setBackground(0);
            this.initOldMovieAnim();
            return;
        }// end function

        private function showMenu(event:MouseEvent) : void
        {
            if (this.state == GameState.GAME)
            {
                this.panelMenu.visible = true;
                this.panelMenu.alpha = 0;
                TweenLite.to(this.panelMenu, 0.4, {alpha:1});
                this.state = GameState.MENU;
            }
            return;
        }// end function

        public function hideMenu() : void
        {
            TweenLite.to(this.panelMenu, 0.2, {alpha:0, onComplete:this.hideMenu2});
            return;
        }// end function

        private function hideMenu2() : void
        {
            this.state = GameState.GAME;
            this.panelMenu.visible = false;
            return;
        }// end function

        private function showUnitInfo(event:MouseEvent) : void
        {
            var _loc_2:Number = NaN;
            var _loc_3:Number = NaN;
            var _loc_4:int = 0;
            var _loc_5:Enemy = null;
            if (!this.tower.isEyeActive())
            {
                _loc_2 = mouseX;
                _loc_3 = mouseY;
                _loc_4 = 0;
                while (_loc_4 < this.enemies.length)
                {
                    
                    _loc_5 = this.enemies[_loc_4];
                    if (_loc_5.alive && _loc_5.collisionToRadius(_loc_2, _loc_3, 0, true))
                    {
                        this.hideCannonInfo();
                        this.unitInfoEnemy = _loc_5;
                        this.unitInfoPanel.visible = true;
                        TweenLite.to(this.unitInfoPanel, 0.5, {alpha:1});
                        UnitInfo.writeUnitInfo(this.unitInfoEnemy, this.unitInfoPanel);
                        this.mcEnemySelect.visible = true;
                        this.mcEnemySelect.gotoAndPlay(1);
                        this.mcEnemySelect.x = this.unitInfoEnemy.levelX + this.unitInfoEnemy.selectRct.x;
                        this.mcEnemySelect.y = this.unitInfoEnemy.levelY + this.unitInfoEnemy.selectRct.y;
                        this.mcEnemySelect.width = this.unitInfoEnemy.selectRct.width;
                        this.mcEnemySelect.height = this.unitInfoEnemy.selectRct.height;
                        this.agButton_btn.alpha = 0.1;
                        return;
                    }
                    _loc_4++;
                }
                this.hideUnitInfo();
            }
            return;
        }// end function

        public function hideUnitInfo() : void
        {
            if (this.unitInfoPanel.visible)
            {
                this.unitInfoEnemy = null;
                this.unitInfoPanel.alpha = 0;
                this.unitInfoPanel.visible = false;
                this.mcEnemySelect.visible = false;
                TweenLite.killTweensOf(this.unitInfoPanel);
                this.agButton_btn.alpha = 1;
            }
            return;
        }// end function

        public function showCannonInfo(param1:Cannon) : void
        {
            if (!this.tower.isEyeActive())
            {
                this.cannonInfo = param1;
                if (param1)
                {
                    this.hideUnitInfo();
                    this.cannonInfoPanel.visible = true;
                    TweenLite.to(this.cannonInfoPanel, 0.5, {alpha:1});
                    CannonInfo.writeCannonInfo(param1.type, param1.upgradeInd, this.cannonInfoPanel);
                    this.agButton_btn.alpha = 0.1;
                }
                else
                {
                    this.hideCannonInfo();
                }
            }
            return;
        }// end function

        private function hideCannonInfo() : void
        {
            this.cannonInfo = null;
            this.cannonInfoPanel.alpha = 0;
            this.cannonInfoPanel.visible = false;
            TweenLite.killTweensOf(this.cannonInfoPanel);
            this.agButton_btn.alpha = 1;
            return;
        }// end function

        public function showCannonInfoBig(param1:int, param2:int, param3:DisplayObject, param4:Number, param5:Number) : void
        {
            if (param3 != this.bigInfoOwner || !this.cannonInfoPanelBig.visible)
            {
                this.bigInfoOwner = param3;
                this.infoBigCannonType = param1;
                this.infoBigUpgrInd = param2;
                this.infoBigPx = param4;
                this.infoBigPy = param5;
                if (this.cannonInfoPanelBig.alpha == 0)
                {
                    this.showCannonInfoBig2();
                }
            }
            return;
        }// end function

        private function showCannonInfoBig2() : void
        {
            setChildIndex(this.cannonInfoPanelBig, (numChildren - 1));
            this.cannonInfoPanelBig.x = this.infoBigPx;
            this.cannonInfoPanelBig.y = this.infoBigPy;
            this.cannonInfoPanelBig.visible = true;
            TweenLite.to(this.cannonInfoPanelBig, 0.27, {alpha:1});
            CannonInfo.writeCannonInfo(this.infoBigCannonType, this.infoBigUpgrInd, this.cannonInfoPanelBig);
            return;
        }// end function

        public function hideCannonInfoBig(param1:DisplayObject) : void
        {
            if (param1 == this.bigInfoOwner || param1 == null)
            {
                this.bigInfoOwner = null;
            }
            TweenLite.to(this.cannonInfoPanelBig, 0.27, {alpha:0, onComplete:this.hideCannonInfoBigAfter});
            return;
        }// end function

        private function hideCannonInfoBigAfter() : void
        {
            this.cannonInfoPanelBig.visible = false;
            if (this.bigInfoOwner != null)
            {
                this.showCannonInfoBig2();
            }
            return;
        }// end function

        private function autoPauseOn(event:Event) : void
        {
            if (autoPause && this.state == GameState.GAME)
            {
                this.pauseOn(null);
            }
            return;
        }// end function

        private function pauseOn(event:MouseEvent) : void
        {
            if (this.state != GameState.PAUSE)
            {
                this.prevState = this.state;
                this.state = GameState.PAUSE;
                this.panelPause.visible = true;
                this.panelPause.alpha = 0;
                TweenLite.to(this.panelPause, 0.4, {alpha:1});
                this.panelPause.txtAutopause.visible = !(event is MouseEvent);
            }
            return;
        }// end function

        private function pauseOff(event:MouseEvent) : void
        {
            this.state = this.prevState;
            TweenLite.to(this.panelPause, 0.2, {alpha:0, onComplete:this.pauseOff2});
            return;
        }// end function

        private function pauseOff2() : void
        {
            this.panelPause.visible = false;
            return;
        }// end function

        private function btEncClick(event:MouseEvent) : void
        {
            if (this.state == GameState.GAME)
            {
                this.state = GameState.ENCICLOPEDIA;
                this.encPanel = new PanelEnc();
                stage.addChild(this.encPanel);
                this.encPanel.visible = true;
                this.encPanel.alpha = 0;
                this.encPanel.x = 0;
                this.encPanel.y = -20;
                TweenLite.to(this.encPanel, 0.5, {alpha:1, x:0, y:0, delay:0.2});
                this.encPanel.initialize();
                this.encPanel.btClose.addEventListener(MouseEvent.CLICK, this.hideEnc, false, 0, true);
            }
            return;
        }// end function

        private function hideEnc(event:MouseEvent) : void
        {
            event.currentTarget.removeEventListener(MouseEvent.CLICK, this.hideEnc);
            if (this.state == GameState.ENCICLOPEDIA)
            {
                this.state = GameState.GAME;
                TweenLite.to(this.encPanel, 0.3, {alpha:0, x:0, y:-20, onComplete:this.hideEnc2});
            }
            return;
        }// end function

        private function hideEnc2() : void
        {
            this.encPanel.dispose();
            this.encPanel.visible = false;
            this.encPanel.parent.removeChild(this.encPanel);
            this.encPanel = null;
            return;
        }// end function

        private function btDoneClick(event:MouseEvent) : void
        {
            var _loc_2:* = event.currentTarget.parent as GlobalUpgradeMenu;
            _loc_2.save();
            this.quit();
            return;
        }// end function

        private function loadLevel() : void
        {
            SoundManager.stopAll();
            this.tower.reset();
            this.health = maxHealth;
            this.levelManager.initializeLevel(levelIndex);
            this.money = this.initMoney + Upgrades.tower.moneyStart;
            this.state = GameState.GAME;
            this.hideUnitInfo();
            this.hideCannonInfo();
            this.hideCannonInfoBig(null);
            this.allHints.visible = false;
            this.achivPanel.initialize(this);
            this.shakeTime = 0;
            return;
        }// end function

        private function makeGameOver() : void
        {
            this.state = GameState.GAME_OVER;
            SoundManager.playOnce("lose.wav", 1);
            this.hideLaser();
            this.panelDefeat = new PanelDefeat();
            this.panelDefeat.alpha = 0;
            TweenLite.to(this.panelDefeat, 1, {alpha:1});
            parent.addChild(this.panelDefeat);
            this.panelDefeat.panel.cont.btQuit.addEventListener(MouseEvent.CLICK, this.btQuitPanDefeatClick, false, 0, true);
            this.panelDefeat.panel.cont.btRestart.addEventListener(MouseEvent.CLICK, this.btRestartPanDefeatClick, false, 0, true);
            setChildIndex(this.agButton_btn, (numChildren - 1));
            return;
        }// end function

        public function hideLaser() : void
        {
            this.eyeEff.visible = false;
            this.tower.eyeRay.visible = false;
            this.tower.stopEyeSound();
            return;
        }// end function

        private function btQuitPanDefeatClick(event:MouseEvent) : void
        {
            this.panelDefeat.panel.cont.btQuit.removeEventListener(MouseEvent.CLICK, this.btQuitPanDefeatClick);
            this.panelDefeat.panel.cont.btRestart.removeEventListener(MouseEvent.CLICK, this.btRestartPanVictClick);
            this.quit();
            return;
        }// end function

        private function btRestartPanDefeatClick(event:MouseEvent) : void
        {
            this.panelDefeat.panel.cont.btQuit.removeEventListener(MouseEvent.CLICK, this.btQuitPanDefeatClick);
            this.panelDefeat.panel.cont.btRestart.removeEventListener(MouseEvent.CLICK, this.btRestartPanVictClick);
            this.restartLevel();
            return;
        }// end function

        private function completeLevel() : void
        {
            var _loc_2:int = 0;
            var _loc_3:int = 0;
            var _loc_4:int = 0;
            this.state = GameState.LEVEL_COMPLETE;
            SoundManager.playOnce("win4.wav", 0.4);
            var _loc_1:* = SoundManager.getSoundByName("snd_game1");
            if (_loc_1)
            {
                _loc_1.muteSmooth();
            }
            if (isChallenge)
            {
                this.starsCount = 1;
            }
            else if (this.health >= this.levelManager.threeStarHealth)
            {
                this.starsCount = 3;
            }
            else if (this.health >= this.levelManager.twoStarHealth)
            {
                this.starsCount = 2;
            }
            else
            {
                this.starsCount = 1;
            }
            this.hideLaser();
            this.tower.removeCannonsEvents();
            this.panelVictory = new PanelVictory();
            this.panelVictory.alpha = 0;
            TweenLite.to(this.panelVictory, 1, {alpha:1});
            this.panelVictory.x = -400;
            this.panelVictory.y = -250;
            addChild(this.panelVictory);
            setChildIndex(this.agButton_btn, (numChildren - 1));
            this.panelVictory.panel.cont.btOk.addEventListener(MouseEvent.CLICK, this.panVicContClick, false, 0, true);
            this.panelVictory.panel.cont.btRestart.addEventListener(MouseEvent.CLICK, this.btRestartPanVictClick, false, 0, true);
            this.bottomMenu.hideAll();
            this.bottomMenuUpgr.hideAll();
            if (isChallenge)
            {
                this.panelVictory.panel.cont.txtHealthScore.visible = false;
                this.panelVictory.panel.cont.txtMoneyScore.visible = false;
                this.panelVictory.panel.cont.txtSc.visible = false;
                this.panelVictory.panel.cont.txtHe.visible = false;
                this.panelVictory.panel.cont.txtMon.visible = false;
                this.panelVictory.panel.cont.txtExtr.y = this.panelVictory.panel.cont.txtHe.y;
                this.panelVictory.panel.cont.txtExtraScore.y = this.panelVictory.panel.cont.txtHealthScore.y;
                this.panelVictory.panel.cont.txtExtraScore.text = challengeScore.toString();
                Saves.curSaves.scoresChallenge[levelIndex] = challengeScore;
            }
            else
            {
                this.panelVictory.panel.cont.txtExtr.visible = false;
                this.panelVictory.panel.cont.txtExtraScore.visible = false;
                _loc_2 = this.health * 100;
                _loc_3 = this.money / 10;
                _loc_4 = _loc_2 + _loc_3;
                if (_loc_4 > Saves.curSaves.scores[levelIndex])
                {
                    Saves.curSaves.scores[levelIndex] = _loc_4;
                }
                this.panelVictory.panel.cont.txtHealthScore.text = _loc_2.toString();
                this.panelVictory.panel.cont.txtMoneyScore.text = this.money.toString();
            }
            this.panelVictory.panel.cont.txtTotalScore.text = Saves.curSaves.totalScore().toString();
            return;
        }// end function

        private function btSubmitPanVictClick(event:MouseEvent) : void
        {
            this.panelVictory.panel.cont.btOk.removeEventListener(MouseEvent.CLICK, this.panVicContClick);
            this.panelVictory.panel.cont.btRestart.removeEventListener(MouseEvent.CLICK, this.btRestartPanVictClick);
            var _loc_2:* = new SplashIn();
            stage.addChild(_loc_2);
            TweenLite.delayedCall(_loc_2.totalFrames, this.btSubmitPanVictClick2, null, true);
            return;
        }// end function

        private function btSubmitPanVictClick2() : void
        {
            this.saveProgress();
            this.dispose();
            Main.main.gotoAndStop("submit");
            return;
        }// end function

        private function btRestartPanVictClick(event:MouseEvent) : void
        {
            this.saveProgress();
            this.panelVictory.panel.cont.btOk.removeEventListener(MouseEvent.CLICK, this.panVicContClick);
            this.panelVictory.panel.cont.btRestart.removeEventListener(MouseEvent.CLICK, this.btRestartPanVictClick);
            this.restartLevel();
            return;
        }// end function

        private function panVicContClick(event:MouseEvent) : void
        {
            SoundManager.muteSmoothAll();
            this.panelVictory.panel.cont.btOk.removeEventListener(MouseEvent.CLICK, this.panVicContClick);
            this.panelVictory.panel.cont.btRestart.removeEventListener(MouseEvent.CLICK, this.btRestartPanVictClick);
            this.saveProgress();
            if (this.levelManager.isChallenge)
            {
                this.quit();
            }
            else
            {
                this.goUpgradesMenu2();
            }
            return;
        }// end function

        private function saveProgress() : void
        {
            var _loc_1:int = 0;
            if (isChallenge)
            {
                Saves.load();
                if (Saves.curSaves.challenge[levelIndex] == 0)
                {
                    MainMenu.isAnimateChallenge = true;
                }
                Saves.curSaves.challenge[levelIndex] = 1;
                Saves.curSaves.scoresChallenge[levelIndex] = challengeScore;
            }
            else if (Saves.curSaves.stars[levelIndex] < this.starsCount)
            {
                MainMenu.isAnimateStar1 = Saves.curSaves.stars[levelIndex] == 0 && this.starsCount > 0;
                MainMenu.isAnimateStar2 = Saves.curSaves.stars[levelIndex] <= 1 && this.starsCount > 1;
                MainMenu.isAnimateStar3 = Saves.curSaves.stars[levelIndex] <= 2 && this.starsCount > 2;
                MainMenu.isAnimateStars = MainMenu.isAnimateStar1 || MainMenu.isAnimateStar2 || MainMenu.isAnimateStar3;
                _loc_1 = this.starsCount - Saves.curSaves.stars[levelIndex];
                Upgrades.starsCount = Upgrades.starsCount + _loc_1;
                Saves.curSaves.stars[levelIndex] = this.starsCount;
                if ((levelIndex + 1) > Saves.curSaves.levelIndex)
                {
                    Saves.curSaves.levelIndex = Utilites.clamp((levelIndex + 1), 0, (Main.totalLevels - 1));
                }
            }
            Saves.save();
            return;
        }// end function

        private function goCongratulation() : void
        {
            this.dispose();
            Main.main.gotoAndStop("congratulations");
            return;
        }// end function

        private function goUpgradesMenu2() : void
        {
            var _loc_4:MovieClip = null;
            var _loc_6:* = levelIndex + 1;
            levelIndex = _loc_6;
            if (levelIndex >= Main.totalLevels)
            {
                _loc_4 = new SplashIn();
                Main.main.stage.addChild(_loc_4);
                TweenLite.delayedCall(_loc_4.totalFrames, this.goCongratulation, null, true);
                return;
            }
            var _loc_1:* = new Plashka2();
            _loc_1.name = "Plashka2";
            _loc_1.x = 0;
            _loc_1.y = 273;
            _loc_1.gotoAndStop(this.plashka.currentFrame);
            addChild(_loc_1);
            var _loc_2:* = new UnderGround();
            _loc_2.name = "UnderGround";
            _loc_2.x = -405;
            _loc_2.y = 295;
            addChild(_loc_2);
            var _loc_3:* = new GlobalUpgradeMenu();
            _loc_3.x = -378;
            _loc_3.y = 320;
            _loc_3.name = "upgrMenu";
            addChild(_loc_3);
            _loc_3.initialize();
            _loc_3.btDone.addEventListener(MouseEvent.CLICK, this.btDoneClick, false, 0, true);
            this.fps = stage.frameRate;
            stage.frameRate = 35;
            TweenLite.to(this, 2.5, {y:-303, delay:0.5, onComplete:this.goUpgradesMenuComplete});
            TweenLite.delayedCall(2, SoundManager.playLoop, ["snd_upgr_music", 0.5]);
            return;
        }// end function

        private function goUpgradesMenuComplete() : void
        {
            stage.frameRate = this.fps;
            MovieClip(getChildByName("upgrMenu")).initEvents();
            return;
        }// end function

        private function keyUpHandler(event:KeyboardEvent) : void
        {
            return;
        }// end function

        public function shake(param1:Number, param2:Number) : void
        {
            if (this.shakeTime <= 0 || param1 > this.shakePower)
            {
                this.shakePower = param1;
            }
            if (this.shakeTime <= 0)
            {
                this.shakeTime = param2;
            }
            return;
        }// end function

        public function showFirstWaveIcons() : void
        {
            TweenLite.to(this.txtLevel, 1, {alpha:1});
            this.levelManager.showFirstIcons();
            return;
        }// end function

        public function onFirstWaveStart() : void
        {
            startTime = getTimer();
            this.radioGame.dispose();
            this.tower.twr.container.head.antena.gotoAndPlay("end waves");
            if (levelIndex == 0 && this.helps.currentHint == 4)
            {
                this.helps.hideHint();
            }
            return;
        }// end function

        private function update(event:Event) : void
        {
            var _loc_3:int = 0;
            var _loc_4:MovieClip = null;
            var _loc_5:RastrMovieClip = null;
            Mouse.show();
            this.c1.visible = false;
            this.updateGUI();
            this.tower.updateClock();
            this.achivPanel.update();
            if (!this.levelManager.gameStarted && this.tower.twr.container.head.antena.currentLabel == "end waves")
            {
                this.tower.twr.container.head.antena.gotoAndPlay("waves");
            }
            var _loc_2:* = getTimer();
            deltaTime = _loc_2 - this.lastTime;
            this.lastTime = _loc_2;
            this.totalTimeMs = this.totalTimeMs + deltaTime;
            if (this.state == GameState.MOVIE_ANIM)
            {
                this.updateShake();
                this.tower.updateAnimation();
                _loc_4 = stage.getChildByName("movieEff") as MovieClip;
                if (_loc_4.currentFrame == 57)
                {
                    TweenMax.to(parent, _loc_4.totalFrames - 57, {colorMatrixFilter:{saturation:1}, useFrames:true});
                }
                if (_loc_4.currentFrame == _loc_4.totalFrames)
                {
                    this.state = GameState.GAME;
                    stage.removeChild(_loc_4);
                    this.helps.initialize(this);
                    if (isChallenge)
                    {
                        TweenLite.delayedCall(1.5, this.showFirstWaveIcons);
                    }
                    else if (!this.helps.isCannonsWillShow())
                    {
                        this.showFirstWaveIcons();
                    }
                }
            }
            if (this.state != GameState.GAME)
            {
                return;
            }
            this.helps.update();
            if (this.state == GameState.HELP)
            {
                return;
            }
            this.updateShake();
            this.canvas.graphics.clear();
            gameTime = gameTime + deltaTime;
            this.levelManager.update();
            if (this.levelManager.isEnded() && this.enemies.length == 0 && this.state == GameState.GAME)
            {
                this.completeLevel();
            }
            _loc_3 = this.bullets.length - 1;
            while (_loc_3 >= 0)
            {
                
                this.bullets[_loc_3].update();
                _loc_3 = _loc_3 - 1;
            }
            this.tower.update();
            this.orderEnemies();
            this.bitmap.bitmapData.fillRect(new Rectangle(0, 0, 810, 510), 0);
            _loc_3 = this.enemies.length - 1;
            while (_loc_3 >= 0)
            {
                
                this.enemies[_loc_3].update();
                _loc_3 = _loc_3 - 1;
            }
            _loc_3 = this.effects.length - 1;
            while (_loc_3 >= 0)
            {
                
                _loc_5 = this.effects[_loc_3];
                _loc_5.update(this.bitmap.bitmapData);
                if (_loc_5.currentFrame == _loc_5.totalFrames)
                {
                    this.removeEffect(_loc_5);
                }
                _loc_3 = _loc_3 - 1;
            }
            if (this.health <= 0)
            {
                this.updateGUI();
                this.makeGameOver();
            }
            return;
        }// end function

        private function updateGUI() : void
        {
            var _loc_1:* = 82 * this.health / maxHealth;
            this.upLeftPanel.panel.healthBar.bar.width = _loc_1;
            this.upLeftPanel.panel.txtMoney.text = this.money.toString();
            if (this.unitInfoPanel.visible)
            {
                this.unitInfoPanel.txtHealth.text = Math.ceil(this.unitInfoEnemy.health).toString() + "/" + this.unitInfoEnemy.maxHealth;
                this.mcEnemySelect.x = this.unitInfoEnemy.levelX + this.unitInfoEnemy.selectRct.x;
                this.mcEnemySelect.y = this.unitInfoEnemy.levelY + this.unitInfoEnemy.selectRct.y;
                if (!this.unitInfoEnemy.alive)
                {
                    this.hideUnitInfo();
                }
            }
            var _loc_2:* = Utilites.clamp((this.levelManager.getWaveGroupIndex() + 1), 1, this.levelManager.totalWaveGroups());
            this.txtLevel.text = "Wave " + _loc_2 + "/" + this.levelManager.totalWaveGroups();
            return;
        }// end function

        private function orderEnemies() : void
        {
            var _loc_2:int = 0;
            var _loc_3:int = 0;
            var _loc_4:Enemy = null;
            var _loc_5:Enemy = null;
            var _loc_1:Boolean = true;
            while (_loc_1)
            {
                
                _loc_1 = false;
                _loc_2 = 0;
                while (_loc_2 < this.enemies.length)
                {
                    
                    _loc_3 = 0;
                    while (_loc_3 < this.enemies.length)
                    {
                        
                        if (_loc_2 == _loc_3)
                        {
                        }
                        else
                        {
                            _loc_4 = this.enemies[_loc_2];
                            _loc_5 = this.enemies[_loc_3];
                            if (_loc_2 < _loc_3 && _loc_4.getBottom() < _loc_5.getBottom())
                            {
                                _loc_1 = true;
                                this.enemies[_loc_3] = _loc_4;
                                this.enemies[_loc_2] = _loc_5;
                            }
                        }
                        _loc_3++;
                    }
                    _loc_2++;
                }
            }
            return;
        }// end function

        private function updateShake() : void
        {
            if (this.shakeTime > 0)
            {
                this.shakeTime = this.shakeTime - deltaTime;
                x = 400 + Utilites.randomNumber(-this.shakePower, this.shakePower);
                y = 250 + Utilites.randomNumber(-this.shakePower, this.shakePower);
            }
            else
            {
                this.shakePower = 0;
                x = 400;
                y = 250;
            }
            return;
        }// end function

        public function addEnemy(param1:Enemy) : void
        {
            addChildAt(param1, this.enLayerIndex);
            param1.initialize(this);
            this.enemies.push(param1);
            return;
        }// end function

        public function drawBar(param1:Number, param2:Number, param3:Number, param4:Number, param5:uint, param6:Number = 1)
        {
            var _loc_7:* = globalToLocal(new Point(param1, param2));
            this.canvas.graphics.beginFill(param5, param6);
            this.canvas.graphics.drawRect(_loc_7.x, _loc_7.y, param4, param3);
            this.canvas.graphics.endFill();
            return;
        }// end function

        public function everyMs(param1:int) : Boolean
        {
            return int((this.totalTimeMs - deltaTime) / param1) != int(this.totalTimeMs / param1);
        }// end function

        public function getEnemiesInRadius(param1:Number, param2:Number, param3:Number) : Array
        {
            var _loc_6:Enemy = null;
            var _loc_4:* = new Array();
            var _loc_5:int = 0;
            while (_loc_5 < this.enemies.length)
            {
                
                _loc_6 = this.enemies[_loc_5];
                if (_loc_6.collisionToRadius(param1, param2, param3))
                {
                    _loc_4.push(_loc_6);
                }
                _loc_5++;
            }
            return _loc_4;
        }// end function

        public function getNearestEnemy(param1:Enemy, param2:Number, param3:Array) : Enemy
        {
            var _loc_9:Enemy = null;
            var _loc_10:Number = NaN;
            var _loc_4:* = param1.levelX;
            var _loc_5:* = param1.levelY;
            var _loc_6:Enemy = null;
            var _loc_7:* = param2;
            var _loc_8:int = 0;
            while (_loc_8 < this.enemies.length)
            {
                
                _loc_9 = this.enemies[_loc_8];
                if (_loc_9.alive && param1.isAir == _loc_9.isAir && param3.indexOf(_loc_9) == -1 && _loc_9.levelX > -380 && _loc_9.levelX < 380)
                {
                    _loc_10 = Utilites.DistBetweenPoints(_loc_4, _loc_5, _loc_9.levelX, _loc_9.levelY);
                    if (_loc_10 < _loc_7)
                    {
                        _loc_7 = _loc_10;
                        _loc_6 = _loc_9;
                    }
                }
                _loc_8++;
            }
            return _loc_6;
        }// end function

        public function addEffect(param1:RastrMovieClip) : void
        {
            this.effects.push(param1);
            return;
        }// end function

        public function removeEffect(param1:RastrMovieClip) : void
        {
            this.effects.splice(this.effects.indexOf(param1), 1);
            return;
        }// end function

        public function setBackground(param1:int) : void
        {
            this.landscape.gotoAndStop(param1);
            this.plashka.gotoAndStop(param1);
            return;
        }// end function

        public function restartLevel() : void
        {
            var _loc_1:int = 0;
            var _loc_2:MovieClip = null;
            Saves.save(false);
            if (this.state != GameState.MOVIE_ANIM)
            {
                _loc_1 = this.enemies.length - 1;
                while (_loc_1 >= 0)
                {
                    
                    this.enemies[_loc_1].dispose();
                    _loc_1 = _loc_1 - 1;
                }
                _loc_1 = this.bullets.length - 1;
                while (_loc_1 >= 0)
                {
                    
                    this.bullets[_loc_1].dispose();
                    _loc_1 = _loc_1 - 1;
                }
                _loc_1 = this.effects.length - 1;
                while (_loc_1 >= 0)
                {
                    
                    this.removeEffect(this.effects[_loc_1]);
                    _loc_1 = _loc_1 - 1;
                }
                _loc_2 = new MovieEffect();
                _loc_2.name = "movieEff";
                stage.addChild(_loc_2);
                TweenLite.delayedCall(15, this.initOldMovieAnim, null, true);
                this.state = GameState.MOVIE_ANIM;
            }
            return;
        }// end function

        private function initOldMovieAnim() : void
        {
            if (this.panelDefeat)
            {
                this.panelDefeat.parent.removeChild(this.panelDefeat);
                this.panelDefeat = null;
            }
            if (this.panelVictory)
            {
                this.panelVictory.parent.removeChild(this.panelVictory);
                this.panelVictory = null;
            }
            this.loadLevel();
            this.tower.twr.container.head.antena.play();
            this.radioGame = new RadioGame();
            this.radioGame.initialize();
            this.canvas.graphics.clear();
            this.bitmap.bitmapData.fillRect(new Rectangle(0, 0, 810, 510), 0);
            this.state = GameState.MOVIE_ANIM;
            this.shake(1, MovieClip(stage.getChildByName("movieEff")).totalFrames / stage.frameRate * 1000 - 1200);
            TweenMax.to(parent, 0.001, {colorMatrixFilter:{saturation:0.35}});
            this.txtLevel.alpha = 0;
            this.panelMenu.visible = false;
            return;
        }// end function

        public function getUnitY(param1:String) : Number
        {
            var _loc_2:* = param1 == "left" ? (this.unitYCountLeft) : (this.unitYCountRight);
            var _loc_3:* = Utilites.randomInt(0, 3);
            var _loc_4:* = Utilites.randBool() ? (1) : (-1);
            var _loc_5:* = _loc_3;
            var _loc_6:int = 0;
            while (_loc_6 < 4)
            {
                
                _loc_3 = _loc_3 + _loc_4;
                if (_loc_3 > 3)
                {
                    _loc_3 = 0;
                }
                if (_loc_3 < 0)
                {
                    _loc_3 = 3;
                }
                if (_loc_2[_loc_5] > _loc_2[_loc_3])
                {
                    _loc_5 = _loc_3;
                }
                _loc_6++;
            }
            var _loc_7:* = _loc_2;
            var _loc_8:* = _loc_5;
            var _loc_9:* = _loc_2[_loc_5] + 1;
            _loc_7[_loc_8] = _loc_9;
            return this.unitYs[_loc_5];
        }// end function

        public function quit() : void
        {
            var _loc_1:MovieClip = null;
            if (this.state != GameState.LOADING)
            {
                this.state = GameState.LOADING;
                _loc_1 = new SplashIn();
                stage.addChild(_loc_1);
                TweenLite.delayedCall(_loc_1.totalFrames, this.quit2, null, true);
            }
            return;
        }// end function

        private function quit2() : void
        {
            Saves.save(false);
            this.dispose();
            MainMenu.fromGame = true;
            Main.main.gotoAndStop("main menu");
            return;
        }// end function

        public function dispose() : void
        {
            var _loc_1:int = 0;
            TweenMax.killAll();
            SoundManager.muteSmoothAll();
            SoundManager.stopAll();
            _loc_1 = this.bullets.length - 1;
            while (_loc_1 >= 0)
            {
                
                this.bullets[_loc_1].dispose();
                _loc_1 = _loc_1 - 1;
            }
            this.bullets = null;
            this.tower.dispose();
            this.tower = null;
            _loc_1 = this.enemies.length - 1;
            while (_loc_1 >= 0)
            {
                
                this.enemies[_loc_1].dispose();
                _loc_1 = _loc_1 - 1;
            }
            this.enemies = null;
            this.effects = null;
            removeChild(this.canvas);
            this.canvas = null;
            this.levelManager.dispose();
            this.levelManager = null;
            this.bottomMenu.dispose();
            this.bottomMenu = null;
            this.bottomMenuUpgr.dispose();
            this.bottomMenuUpgr = null;
            this.bitmap.bitmapData.dispose();
            removeChild(this.bitmap);
            this.bitmap = null;
            removeChild(this.unitInfoPanel);
            this.unitInfoPanel = null;
            this.unitInfoEnemy = null;
            this.cannonInfo = null;
            removeChild(this.cannonInfoPanel);
            this.cannonInfoPanel = null;
            removeChild(this.cannonInfoPanelBig);
            this.cannonInfoPanelBig = null;
            this.bigInfoOwner = null;
            removeChild(this.eyeBarPanel);
            this.eyeBarPanel = null;
            this.panelPause.removeEventListener(MouseEvent.CLICK, this.pauseOff);
            this.panelPause.parent.removeChild(this.panelPause);
            this.panelPause = null;
            this.panelMenu.dispose();
            this.panelMenu = null;
            this.achivPanel.dispoe();
            this.achivPanel = null;
            this.helps = null;
            if (this.panelDefeat)
            {
                this.panelDefeat.parent.removeChild(this.panelDefeat);
                this.panelDefeat = null;
            }
            if (this.panelVictory)
            {
                this.panelVictory.parent.removeChild(this.panelVictory);
                this.panelVictory = null;
            }
            stage.removeEventListener(Event.DEACTIVATE, this.autoPauseOn);
            stage.removeEventListener(KeyboardEvent.KEY_UP, this.keyUpHandler);
            stage.removeEventListener(MouseEvent.CLICK, this.showUnitInfo);
            removeEventListener(Event.ENTER_FRAME, this.update);
            this.upRightPanel.panel.btPause.removeEventListener(MouseEvent.CLICK, this.pauseOn);
            this.upRightPanel.panel.btEnc.removeEventListener(MouseEvent.CLICK, this.btEncClick);
            this.upRightPanel.panel.btMenu.removeEventListener(MouseEvent.CLICK, this.showMenu);
            this.upRightPanel.panel.btPlus.removeEventListener(MouseEvent.CLICK, Main.main.goMoreGames);
            var _loc_2:* = getChildByName("upgrMenu") as GlobalUpgradeMenu;
            if (_loc_2)
            {
                _loc_2.dispose();
                removeChild(getChildByName("UnderGround"));
                removeChild(getChildByName("Plashka2"));
            }
            if (parent)
            {
                parent.removeChild(this);
            }
            GC.collect();
            return;
        }// end function

    }
}
