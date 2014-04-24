package 
{
    import __AS3__.vec.*;
    import flash.display.*;
    import flash.events.*;

    public class Achivements extends Object
    {
        private var state:int = 0;
        private var level:Level;
        private var panel:MovieClip;
        private var achToShow:Vector.<int>;
        public static var eyeActive:Boolean = false;
        public static var clockActive:Boolean = false;
        public static var machBuyed:Boolean = false;
        public static var heavyBuyed:Boolean = false;
        public static var sawsBuyed:Boolean = false;
        public static var lightBuyed:Boolean = false;
        public static var critFire:Boolean = false;
        public static var critShock:Boolean = false;

        public function Achivements()
        {
            this.achToShow = new Vector.<int>;
            return;
        }// end function

        public function initialize(param1:Level) : void
        {
            this.level = param1;
            eyeActive = false;
            clockActive = false;
            machBuyed = false;
            heavyBuyed = false;
            sawsBuyed = false;
            lightBuyed = false;
            critFire = false;
            critShock = false;
            return;
        }// end function

        private function keyUpHandler(event:KeyboardEvent) : void
        {
            var _loc_2:* = event.keyCode - 49;
            if (event.ctrlKey && _loc_2 >= 0 && _loc_2 < 18)
            {
                this.showAchivement((_loc_2 - 1));
            }
            return;
        }// end function

        public function update() : void
        {
            var _loc_2:Boolean = false;
            var _loc_3:int = 0;
            if (Level.isChallenge)
            {
                return;
            }
            var _loc_1:* = this.level.state == GameState.LEVEL_COMPLETE || this.level.state == GameState.GAME_COMPLETE;
            if (!Saves.curSaves.achivGetted[0])
            {
                if (Saves.curSaves.enemiesCount >= 100)
                {
                    this.showAchivement(0);
                }
            }
            if (!Saves.curSaves.achivGetted[1])
            {
                if (Saves.curSaves.enemiesCount >= 3000)
                {
                    this.showAchivement(1);
                }
            }
            if (!Saves.curSaves.achivGetted[2])
            {
                if (_loc_1 && this.level.health == Level.maxHealth)
                {
                    this.showAchivement(2);
                }
            }
            if (!Saves.curSaves.achivGetted[3])
            {
                if (_loc_1 && this.level.money >= 10000)
                {
                    this.showAchivement(3);
                }
            }
            if (!Saves.curSaves.achivGetted[4])
            {
                if (_loc_1 && this.level.money >= 30000)
                {
                    this.showAchivement(4);
                }
            }
            if (!Saves.curSaves.achivGetted[5])
            {
                if (clockActive)
                {
                    this.showAchivement(5);
                }
            }
            if (!Saves.curSaves.achivGetted[6])
            {
                if (_loc_1 && !Level.isChallenge && !machBuyed && !sawsBuyed && !heavyBuyed && lightBuyed)
                {
                    this.showAchivement(6);
                }
            }
            if (!Saves.curSaves.achivGetted[7])
            {
                if (_loc_1 && !Level.isChallenge && !machBuyed && sawsBuyed && !heavyBuyed && !lightBuyed)
                {
                    this.showAchivement(7);
                }
            }
            if (!Saves.curSaves.achivGetted[8])
            {
                if (_loc_1 && !Level.isChallenge && !machBuyed && !sawsBuyed && heavyBuyed && !lightBuyed)
                {
                    this.showAchivement(8);
                }
            }
            if (!Saves.curSaves.achivGetted[9])
            {
                if (_loc_1 && !Level.isChallenge && machBuyed && !sawsBuyed && !heavyBuyed && !lightBuyed)
                {
                    this.showAchivement(9);
                }
            }
            if (!Saves.curSaves.achivGetted[10])
            {
                if (Saves.curSaves.enemiesCountSplash >= 100)
                {
                    this.showAchivement(10);
                }
            }
            if (!Saves.curSaves.achivGetted[11])
            {
                if (Saves.curSaves.enemiesCountChain >= 100)
                {
                    this.showAchivement(11);
                }
            }
            if (!Saves.curSaves.achivGetted[12])
            {
                if (_loc_1 && !eyeActive && this.level.tower.eyeActivity == "normal")
                {
                    this.showAchivement(12);
                }
            }
            if (!Saves.curSaves.achivGetted[13])
            {
                if (Saves.curSaves.enemiesCountCrit >= 100)
                {
                    this.showAchivement(13);
                }
            }
            if (!Saves.curSaves.achivGetted[14])
            {
                if (_loc_1 && this.level.health / Level.maxHealth <= 0.05)
                {
                    this.showAchivement(14);
                }
            }
            if (!Saves.curSaves.achivGetted[15])
            {
                if (critFire)
                {
                    this.showAchivement(15);
                }
            }
            if (!Saves.curSaves.achivGetted[16])
            {
                if (critShock)
                {
                    this.showAchivement(16);
                }
            }
            if (!Saves.curSaves.achivGetted[17])
            {
                _loc_2 = true;
                _loc_3 = 0;
                while (_loc_3 < Main.totalLevels)
                {
                    
                    if (Saves.curSaves.stars[_loc_3] == 0 || Saves.curSaves.challenge[_loc_3] == 0)
                    {
                        _loc_2 = false;
                        break;
                    }
                    _loc_3++;
                }
                if (_loc_2)
                {
                    this.showAchivement(17);
                }
            }
            return;
        }// end function

        public function dispoe() : void
        {
            return;
        }// end function

        private function showAchivement(param1:int) : void
        {
            if (Saves.curSaves.achivGetted[param1] == false && this.achToShow.indexOf(param1) == -1)
            {
                this.achToShow.push(param1);
                if (this.state == 0)
                {
                    this.showAch();
                }
            }
            return;
        }// end function

        private function showAch() : void
        {
            var _loc_1:int = 0;
            this.state = 1;
            _loc_1 = this.achToShow.shift();
            this.panel = new AchPanelGame();
            Main.main.stage.addChild(this.panel);
            this.panel.panel.gotoAndStop((_loc_1 + 1));
            this.panel.panel.mc.gotoAndStop(1);
            this.panel.x = 0;
            this.panel.y = 90;
            var _loc_2:* = new AutoRemoveObject(this.panel, this.afterShow);
            Saves.curSaves.achivGetted[_loc_1] = true;
            SoundManager.playOnce("window_7.wav", 0.7);
            Saves.save(false);
            return;
        }// end function

        private function afterShow() : void
        {
            this.state = 0;
            this.panel.stop();
            this.panel = null;
            if (this.achToShow.length > 0)
            {
                this.showAch();
            }
            return;
        }// end function

    }
}
