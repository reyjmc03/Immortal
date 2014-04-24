package 
{
    import Enemy.*;
    import Walker2.*;
    import flash.geom.*;

    public class Walker2 extends Enemy
    {

        public function Walker2()
        {
            health = 4000;
            minDamage = 20;
            maxDamage = 35;
            return;
        }// end function

        override public function initialize(param1:Level) : void
        {
            infoName = "Grand Walker";
            shootSpeed = 1000;
            armor = 8;
            money = 10000;
            modifers.gunIgnore = 30;
            modifers.lightIgnore = 25;
            modifers.heavyAdd = 25;
            modifers.sawAdd = 25;
            collideRadiuses.push(new CollideRadius(this, 0, 0, 28));
            collideRadiuses.push(new CollideRadius(this, 0, 45, 15, true));
            collideRadiuses.push(new CollideRadius(this, 0, 80, 28, true));
            collideRadiuses.push(new CollideRadius(this, 0, 110, 28, true));
            collideRadiuses.push(new CollideRadius(this, 0, 130, 28, true));
            collideRadiuses.push(new CollideRadius(this, 0, 160, 28, true));
            collideRadiuses.push(new CollideRadius(this, 0, 195, 32, true));
            mcName = "Walker2Mc";
            super.initialize(param1);
            walk1 = 1;
            walk2 = 120;
            shoot1 = 121;
            shoot2 = 135;
            shootFrame = shoot1 + 3;
            die1 = 136;
            die2 = mcEnemy.totalFrames;
            healthY = -35;
            healthW = 80;
            speed = -0.38 * scaleX;
            y = 0;
            line = 1;
            stopX = Utilites.randomInt(150, 180) * scaleX;
            fireEffect = "FireWalker2";
            shockEffect = "ShockWalker2";
            selectRct = new Rectangle(-4.25, 224, 129.35, 17.25);
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
