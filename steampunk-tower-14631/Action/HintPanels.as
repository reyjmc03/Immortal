package 
{
    import com.greensock.*;
    import flash.display.*;
    import flash.events.*;
    import flash.geom.*;
    import flash.utils.*;

    public class HintPanels extends Object
    {
        private var level:Level;
        private var newCannonsFrame:Array;
        public var newCannonsIsShow:Boolean = false;
        private var helps:Array;
        private var helpsFrames:Array;
        private var helpsIsShow:Array;
        private var challengeShows:Boolean = false;
        public var currentHint:int = 1;
        private var upgrCannon:Cannon;
        private var upgrCannonHint:MovieClip;
        private var chaPanel:MovieClip;
        private var helpPanel:MovieClip;
        private var enemiesPanel:MovieClip;
        private var cannonsPanel:MovieClip;
        public static const enemies:Array = ["unit1", "unit2", "wheel", "tanket", "car", "tank1", "tank2", "tank3", "tank4", "walker1", "walker2", "parashut", "airplane", "heli", "aerostat", "balloon", "airship"];
        public static const newCannons:Array = [1, 2, 5, 8, 10, 11];
        public static var cannonBuyClick:Boolean = false;
        public static var cannonBuyed:Boolean = false;
        public static var eyeReady:Boolean = false;
        public static var cannonReadyUpgrade:Boolean = false;
        public static var cannonFirstReload:Boolean = false;
        public static var cannonDragged:Boolean = false;
        public static var buyMenuShow:Boolean = false;

        public function HintPanels()
        {
            this.newCannonsFrame = ["1", "2", "3.1", "3.2", "4.1", "4.2"];
            this.helps = [1, 2, 3, 4, 5, 6];
            this.helpsFrames = [1, 2, 3, 4, 5, 6];
            this.helpsIsShow = [false, false, false, false, false, false];
            return;
        }// end function

        public function isCannonsWillShow() : Boolean
        {
            return newCannons.indexOf((Level.levelIndex + 1)) > -1;
        }// end function

        public function initialize(param1:Level) : void
        {
            this.level = param1;
            param1.allHints.visible = false;
            param1.allHints.mouseEnabled = false;
            param1.allHints.mouseChildren = false;
            this.newCannonsIsShow = false;
            eyeReady = false;
            cannonBuyed = false;
            cannonBuyClick = false;
            cannonReadyUpgrade = false;
            cannonFirstReload = false;
            var _loc_2:int = 0;
            while (_loc_2 < this.helpsIsShow.length)
            {
                
                this.helpsIsShow[_loc_2] = false;
                _loc_2++;
            }
            this.currentHint = 1;
            buyMenuShow = false;
            cannonDragged = false;
            this.upgrCannon = null;
            return;
        }// end function

        public function update() : void
        {
            if (Level.isChallenge)
            {
            }
            else
            {
                if (this.level.state == GameState.GAME)
                {
                    this.updateHelp();
                }
                if (this.level.state == GameState.GAME)
                {
                    this.showNewCannons();
                }
                if (this.level.state == GameState.GAME)
                {
                    this.updateHints();
                }
            }
            return;
        }// end function

        private function updateHints() : void
        {
            var _loc_1:Cannon = null;
            var _loc_2:int = 0;
            var _loc_3:Cannon = null;
            var _loc_4:Point = null;
            if (Level.levelIndex == 0)
            {
                if (cannonDragged && this.currentHint == 5)
                {
                    this.showHint(4);
                    this.level.showFirstWaveIcons();
                }
                if (buyMenuShow && this.currentHint == 1)
                {
                    this.showHint(2);
                }
                if (!buyMenuShow && this.currentHint == 2)
                {
                    this.hideHint();
                    this.currentHint = 1;
                }
                if (this.currentHint == 4 && this.level.levelManager.getWaveGroupIndex() == 1)
                {
                    this.showHint(13);
                    this.upgrCannonHint = new AllHintsAni();
                    this.upgrCannonHint.mcHint.gotoAndStop(14);
                    this.level.addChild(this.upgrCannonHint);
                    this.upgrCannonHint.x = 190;
                    this.upgrCannonHint.y = 153;
                }
                if (this.currentHint == 13)
                {
                    _loc_2 = 0;
                    while (_loc_2 < this.level.tower.cannons.length)
                    {
                        
                        if (this.level.tower.cannons[_loc_2].cell.col == 0)
                        {
                            this.hideHint();
                            if (this.upgrCannonHint)
                            {
                                this.level.removeChild(this.upgrCannonHint);
                                this.upgrCannonHint = null;
                            }
                        }
                        _loc_2++;
                    }
                }
                if (this.currentHint == 13 && this.level.levelManager.gameStarted && getTimer() - Level.startTime > 3000 && this.level.tower.cannonsCount() <= 1 && !this.level.bottomMenu.isVisible() && this.level.allHints.visible == false && (this.level.money >= CannonMachineGun.price || this.level.money >= CannonHeavyGun.price || this.level.money >= CannonElectroGun.price || this.level.money >= CannonSawGun.price))
                {
                    this.showHint(6);
                    if (this.upgrCannonHint)
                    {
                        this.level.removeChild(this.upgrCannonHint);
                        this.upgrCannonHint = null;
                    }
                }
            }
            if (!Saves.curSaves.isCannonUpgrade && Saves.curSaves.helpUpgShows && this.level.state == GameState.GAME)
            {
                if (this.upgrCannon == null || this.level.tower.cannons.indexOf(this.upgrCannon) == -1 || this.upgrCannon.getUpgradePrice(1) > this.level.money)
                {
                    this.upgrCannon = null;
                    _loc_2 = 0;
                    while (_loc_2 < this.level.tower.cannons.length)
                    {
                        
                        _loc_3 = this.level.tower.cannons[_loc_2];
                        if (_loc_3.canUpgrade() && _loc_3.getUpgradePrice(1) <= this.level.money)
                        {
                            this.upgrCannon = _loc_3;
                            break;
                        }
                        _loc_2++;
                    }
                }
                _loc_1 = this.level.tower.getPodvalCannon();
                if (_loc_1 && this.upgrCannon && _loc_1 != this.upgrCannon && _loc_1.getUpgradePrice(1) <= this.level.money)
                {
                    this.upgrCannon = _loc_1;
                }
                if (this.upgrCannon != null)
                {
                    if (!this.upgrCannon.isPodval)
                    {
                        if (this.currentHint != 11 || !this.level.allHints.visible)
                        {
                            if (this.upgrCannonHint == null)
                            {
                                this.upgrCannonHint = new AllHintsAni();
                                this.upgrCannonHint.mcHint.gotoAndStop(9);
                                this.level.addChild(this.upgrCannonHint);
                            }
                            this.showHint(11);
                        }
                        if (this.upgrCannonHint)
                        {
                            this.upgrCannonHint.visible = true;
                            _loc_4 = this.upgrCannon.localToGlobal(new Point(30, 0));
                            _loc_4 = this.level.globalToLocal(_loc_4);
                            this.upgrCannonHint.x = _loc_4.x;
                            this.upgrCannonHint.y = _loc_4.y;
                        }
                    }
                    else
                    {
                        this.upgrCannonHint.visible = false;
                        if (this.currentHint != 10 && this.upgrCannon.getUpgradePrice(1) <= this.level.money)
                        {
                            this.showHint(10);
                        }
                    }
                    if (this.upgrCannon.getUpgradePrice(1) > this.level.money)
                    {
                        this.upgrCannonHint.visible = false;
                        this.hideHint();
                    }
                }
                else if (this.currentHint == 10 || this.currentHint == 11)
                {
                    this.hideHint();
                }
            }
            if (Saves.curSaves.isCannonUpgrade && (this.currentHint == 10 || this.currentHint == 11))
            {
                this.hideHint();
                if (this.upgrCannonHint != null && this.upgrCannonHint.parent)
                {
                    this.upgrCannonHint.parent.removeChild(this.upgrCannonHint);
                }
                this.upgrCannonHint = null;
            }
            return;
        }// end function

        public function showHint(param1:int) : void
        {
            this.currentHint = param1;
            this.level.setChildIndex(this.level.allHints, (this.level.numChildren - 1));
            this.level.allHints.mcHint.gotoAndStop(param1);
            this.level.allHints.alpha = 0;
            this.level.allHints.visible = true;
            TweenLite.to(this.level.allHints, 0.3, {alpha:1, delay:0.2});
            if (param1 == 1)
            {
                this.level.allHints.x = -13;
                this.level.allHints.y = 210;
            }
            else if (param1 == 5)
            {
                this.level.allHints.x = 80;
                this.level.allHints.y = 155;
            }
            else if (param1 == 2)
            {
                this.level.allHints.x = -125;
                this.level.allHints.y = 190;
            }
            else if (param1 == 4)
            {
                this.level.allHints.x = 362;
                this.level.allHints.y = -2;
            }
            else if (param1 == 6)
            {
                this.level.allHints.x = -13;
                this.level.allHints.y = 210;
            }
            else if (param1 == 11)
            {
                this.level.allHints.x = 15;
                this.level.allHints.y = 218;
            }
            else if (param1 == 10)
            {
                this.level.allHints.x = 163;
                this.level.allHints.y = 190;
            }
            else if (param1 == 12)
            {
                this.level.allHints.x = 362;
                this.level.allHints.y = -7;
            }
            else if (param1 == 13)
            {
                this.level.allHints.x = -80;
                this.level.allHints.y = 155;
            }
            else if (param1 == 15)
            {
                this.level.allHints.x = 0;
                this.level.allHints.y = -120;
            }
            return;
        }// end function

        public function hideHint() : void
        {
            this.level.allHints.visible = false;
            return;
        }// end function

        private function showChallenge() : void
        {
            var _loc_3:String = null;
            this.challengeShows = true;
            this.chaPanel = new PanelChallenge();
            var _loc_1:* = this.level.health / Level.maxHealth * 100;
            _loc_1 = _loc_1 + (5 - _loc_1 % 5);
            this.chaPanel.panel.txtHealth.text = _loc_1.toString() + "%";
            this.chaPanel.panel.txtMaxCannons.text = LevelChallengeSettings.maxCannons;
            this.chaPanel.panel.txtTower.text = LevelChallengeSettings.towerLevel;
            this.chaPanel.panel.txtUpgrades.text = LevelChallengeSettings.globalUpgrades;
            this.chaPanel.panel.iconEye.gotoAndStop(this.level.tower.eyeActivity);
            this.chaPanel.panel.txtEye.text = this.level.tower.eyeActivity;
            if (this.level.tower.eyeActivity == "normal")
            {
                this.chaPanel.panel.txtEye.text = "The “Eye” is : on";
            }
            else if (this.level.tower.eyeActivity == "off")
            {
                this.chaPanel.panel.txtEye.text = "The “Eye” is : off";
            }
            else if (this.level.tower.eyeActivity == "always")
            {
                this.chaPanel.panel.txtEye.text = "The “Eye” is : unlimited";
            }
            var _loc_2:int = 0;
            if (LevelChallengeSettings.machinegun)
            {
                _loc_2++;
            }
            if (LevelChallengeSettings.heavygun)
            {
                _loc_2++;
            }
            if (LevelChallengeSettings.saws)
            {
                _loc_2++;
            }
            if (LevelChallengeSettings.lightning)
            {
                _loc_2++;
            }
            this.chaPanel.panel.txtCannons.text = "";
            if (_loc_2 == 0)
            {
                this.chaPanel.panel.txtMaxCannons.text = "0";
                this.chaPanel.panel.txtCannons.text = "No cannons";
            }
            else if (_loc_2 == 4)
            {
                this.chaPanel.panel.txtCannons.text = "All cannons";
            }
            else if (_loc_2 == 1)
            {
                _loc_3 = "Only ";
                if (LevelChallengeSettings.machinegun)
                {
                    this.chaPanel.panel.txtCannons.text = this.chaPanel.panel.txtCannons.text + (_loc_3 + "machineguns");
                }
                if (LevelChallengeSettings.heavygun)
                {
                    this.chaPanel.panel.txtCannons.text = this.chaPanel.panel.txtCannons.text + (_loc_3 + "heavyguns");
                }
                if (LevelChallengeSettings.saws)
                {
                    this.chaPanel.panel.txtCannons.text = this.chaPanel.panel.txtCannons.text + (_loc_3 + "saws");
                }
                if (LevelChallengeSettings.lightning)
                {
                    this.chaPanel.panel.txtCannons.text = this.chaPanel.panel.txtCannons.text + (_loc_3 + "lightnings");
                }
            }
            else if (_loc_2 > 1)
            {
                _loc_3 = "No ";
                if (!LevelChallengeSettings.machinegun)
                {
                    this.chaPanel.panel.txtCannons.text = this.chaPanel.panel.txtCannons.text + (_loc_3 + "machineguns\n");
                }
                if (!LevelChallengeSettings.heavygun)
                {
                    this.chaPanel.panel.txtCannons.text = this.chaPanel.panel.txtCannons.text + (_loc_3 + "heavyguns\n");
                }
                if (!LevelChallengeSettings.saws)
                {
                    this.chaPanel.panel.txtCannons.text = this.chaPanel.panel.txtCannons.text + (_loc_3 + "saws\n");
                }
                if (!LevelChallengeSettings.lightning)
                {
                    this.chaPanel.panel.txtCannons.text = this.chaPanel.panel.txtCannons.text + (_loc_3 + "lightnings\n");
                }
            }
            this.chaPanel.panel.btPlay.addEventListener(MouseEvent.CLICK, this.chaPlayClick);
            this.level.state = GameState.HELP;
            this.level.parent.addChild(this.chaPanel);
            SoundManager.playOnce("window_4.wav", 0.5);
            return;
        }// end function

        private function chaPlayClick(event:MouseEvent) : void
        {
            SoundManager.playOnce("window_4.wav", 0.5);
            this.chaPanel.panel.btPlay.removeEventListener(MouseEvent.CLICK, this.chaPlayClick);
            this.chaPanel.play();
            var _loc_2:* = this.chaPanel.totalFrames - this.chaPanel.currentFrame;
            TweenLite.delayedCall(_loc_2, this.hideChaPanel, null, true);
            return;
        }// end function

        private function hideChaPanel() : void
        {
            this.chaPanel.stop();
            this.chaPanel.parent.removeChild(this.chaPanel);
            this.level.state = GameState.GAME;
            this.chaPanel = null;
            this.level.showFirstWaveIcons();
            return;
        }// end function

        private function updateHelp() : void
        {
            if (Level.levelIndex == 0)
            {
                if (this.helpsIsShow[0] == false)
                {
                    this.showHelp(0);
                }
                if (this.helpsIsShow[0] && this.helpsIsShow[1] == false && cannonBuyed)
                {
                    this.showHelp(1);
                }
            }
            else if (Level.levelIndex == 1)
            {
                if (this.helpsIsShow[2] == false && this.level.levelManager.getWaveGroupIndex() == 1)
                {
                    this.showHelp(2);
                }
            }
            else if (Level.levelIndex == 2)
            {
                if (this.helpsIsShow[5] == false && eyeReady)
                {
                    this.showHelp(5);
                }
            }
            if (this.helpsIsShow[3] == false && this.level.levelManager.maxUpgradeIndex > 0 && cannonReadyUpgrade && !Saves.curSaves.helpUpgShows)
            {
                this.showHelp(3);
                Saves.curSaves.helpUpgShows = true;
            }
            if (this.helpsIsShow[4] == false && cannonFirstReload && !Saves.curSaves.helpReloadShows)
            {
                this.showHelp(4);
                Saves.curSaves.helpReloadShows = true;
            }
            return;
        }// end function

        private function showHelp(param1:int) : void
        {
            this.helpsIsShow[param1] = true;
            this.helpPanel = new PanelGameHelp();
            this.helpPanel.poster.gotoAndStop((param1 + 1));
            this.helpPanel.poster.movie.stop();
            this.helpPanel.help_txt.descr.gotoAndStop((param1 + 1));
            this.helpPanel.help_txt.btPlay.addEventListener(MouseEvent.CLICK, this.helpPlayClick, false, 0, true);
            this.level.state = GameState.HELP;
            this.level.parent.addChild(this.helpPanel);
            SoundManager.playOnce("window_4.wav", 0.5);
            return;
        }// end function

        private function helpPlayClick(event:MouseEvent) : void
        {
            SoundManager.playOnce("window_4.wav", 0.5);
            this.helpPanel.help_txt.btPlay.removeEventListener(MouseEvent.CLICK, this.helpPlayClick);
            this.helpPanel.play();
            var _loc_2:* = this.helpPanel.totalFrames - this.helpPanel.currentFrame;
            TweenLite.delayedCall(_loc_2, this.hideHelpPanel, null, true);
            if (this.helpPanel.poster.currentFrame == 1)
            {
                this.showHint(1);
            }
            if (this.helpPanel.poster.currentFrame == 2)
            {
                this.showHint(5);
            }
            if (this.helpPanel.poster.currentFrame == 3)
            {
                this.showHint(12);
            }
            return;
        }// end function

        private function hideHelpPanel() : void
        {
            this.helpPanel.stop();
            this.helpPanel.parent.removeChild(this.helpPanel);
            this.level.state = GameState.GAME;
            this.helpPanel = null;
            return;
        }// end function

        public function enemyCreated(param1:String) : void
        {
            var _loc_3:String = null;
            if (Level.isChallenge || param1 == "unit1")
            {
                return;
            }
            var _loc_2:* = enemies.indexOf(param1);
            if (_loc_2 > -1 && Saves.curSaves.enemyIsShow[_loc_2] == false)
            {
                this.level.hideLaser();
                Saves.curSaves.enemyIsShow[_loc_2] = true;
                this.enemiesPanel = new PanelNewEnemy();
                _loc_3 = enemies[_loc_2];
                this.enemiesPanel.poster.gotoAndStop(_loc_3);
                this.enemiesPanel.enemy_txt.descr.gotoAndStop(_loc_3);
                this.enemiesPanel.enemy_txt.btPlay.addEventListener(MouseEvent.CLICK, this.enemiesPlayClick, false, 0, true);
                this.level.state = GameState.HELP;
                this.level.parent.addChild(this.enemiesPanel);
                SoundManager.playOnce("window_4.wav", 0.5);
            }
            return;
        }// end function

        private function enemiesPlayClick(event:MouseEvent) : void
        {
            SoundManager.playOnce("window_4.wav", 0.5);
            this.enemiesPanel.enemy_txt.btPlay.removeEventListener(MouseEvent.CLICK, this.enemiesPlayClick);
            this.enemiesPanel.play();
            var _loc_2:* = this.enemiesPanel.totalFrames - this.enemiesPanel.currentFrame;
            TweenLite.delayedCall(_loc_2, this.hideEnemiesPanel, null, true);
            return;
        }// end function

        private function hideEnemiesPanel() : void
        {
            this.enemiesPanel.stop();
            this.enemiesPanel.parent.removeChild(this.enemiesPanel);
            this.enemiesPanel = null;
            this.level.state = GameState.GAME;
            Saves.save();
            return;
        }// end function

        private function showNewCannons() : void
        {
            var _loc_2:String = null;
            if (this.newCannonsIsShow)
            {
                return;
            }
            var _loc_1:* = newCannons.indexOf((Level.levelIndex + 1));
            if (_loc_1 > 0 || _loc_1 == 0 && cannonBuyClick && this.helpsIsShow[0] == true)
            {
                this.newCannonsIsShow = true;
                this.cannonsPanel = new PanelNewCannons();
                _loc_2 = this.newCannonsFrame[_loc_1];
                this.cannonsPanel.poster1.gotoAndStop(_loc_2);
                trace(this.cannonsPanel.poster1 + "hints");
                this.cannonsPanel.poster2.gotoAndStop(_loc_2);
                this.cannonsPanel.poster3.gotoAndStop(_loc_2);
                this.cannonsPanel.poster4.gotoAndStop(_loc_2);
                this.cannonsPanel.cannons_txt.descr.gotoAndStop(_loc_2);
                this.cannonsPanel.cannons_txt.btPlay.addEventListener(MouseEvent.CLICK, this.cannonsPlayClick, false, 9, true);
                this.level.state = GameState.HELP;
                this.level.parent.addChild(this.cannonsPanel);
                SoundManager.playOnce("window_4.wav", 0.5);
                this.level.allHints.visible = false;
            }
            return;
        }// end function

        private function cannonsPlayClick(event:MouseEvent) : void
        {
            SoundManager.playOnce("window_4.wav", 0.5);
            this.cannonsPanel.cannons_txt.btPlay.removeEventListener(MouseEvent.CLICK, this.cannonsPlayClick);
            this.cannonsPanel.play();
            var _loc_2:* = this.cannonsPanel.totalFrames - this.cannonsPanel.currentFrame;
            TweenLite.delayedCall(_loc_2, this.hideCannonPanel, null, true);
            return;
        }// end function

        private function hideCannonPanel() : void
        {
            this.cannonsPanel.stop();
            this.cannonsPanel.parent.removeChild(this.cannonsPanel);
            this.cannonsPanel = null;
            this.level.state = GameState.GAME;
            if (Level.levelIndex == 0)
            {
                TweenLite.delayedCall(0.2, this.level.bottomMenu.showBuyButtons);
            }
            if (Level.levelIndex != 0 && this.isCannonsWillShow())
            {
                this.level.showFirstWaveIcons();
            }
            return;
        }// end function

    }
}
