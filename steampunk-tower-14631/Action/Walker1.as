package 
{
    import Enemy.*;
    import Walker1.*;
    import flash.geom.*;

    public class Walker1 extends Enemy
    {

        public function Walker1()
        {
            health = 700;
            minDamage = 15;
            maxDamage = 30;
            return;
        }// end function

        override public function initialize(param1:Level) : void
        {
            infoName = "Walker";
            shootSpeed = 1000;
            armor = 6;
            money = 5000;
            modifers.gunIgnore = 20;
            modifers.lightIgnore = 30;
            modifers.heavyAdd = 20;
            modifers.sawAdd = 30;
            collideRadiuses.push(new CollideRadius(this, 0, 0, 23));
            collideRadiuses.push(new CollideRadius(this, 0, 40, 20, true));
            collideRadiuses.push(new CollideRadius(this, 0, 60, 20, true));
            collideRadiuses.push(new CollideRadius(this, 0, 80, 20, true));
            collideRadiuses.push(new CollideRadius(this, 0, 100, 20, true));
            collideRadiuses.push(new CollideRadius(this, 0, 110, 25, true));
            mcName = "Walker1Mc";
            super.initialize(param1);
            walk1 = 1;
            walk2 = 40;
            shoot1 = 41;
            shoot2 = 46;
            shootFrame = shoot1 + 3;
            die1 = 47;
            die2 = mcEnemy.totalFrames;
            healthY = -30;
            healthW = 50;
            speed = -0.5 * scaleX;
            y = Utilites.randomNumber(50, 100);
            line = 1;
            stopX = Utilites.randomInt(150, 180) * scaleX;
            fireEffect = "FireWalker";
            shockEffect = "ShockWalker";
            selectRct = new Rectangle(-0.75, 129.95, 90.85, 15.25);
            return;
        }// end function

        override protected function die(param1:Bullet = null) : void
        {
            if (alive)
            {
                super.die(param1);
                level.shake(2, 700);
            }
            return;
        }// end function

    }
}
