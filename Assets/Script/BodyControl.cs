using UnityEngine;
using System.Collections;

public class BodyControl : MonoBehaviour
{
    public GameObject body_tower;
    public GameObject Body_tower;
    public GameObject parent;
    public GameObject top_tower;
    public Vector3 nextPosition = new Vector3(-200, -338, 0);

    public Vector3 fromPosition;
    public Vector3 toPosition;
    public int number_Of_Floor = 0;

    // Use this for initialization
    void Start()
    {
        addFloor();
        toPosition = new Vector3(-11, -107, 0);
        fromPosition = new Vector3(-11, -173, 0);
    }

    void addFloor()
    {
        Body_tower = Instantiate(body_tower) as GameObject;
        Body_tower.transform.parent = parent.transform;
        Body_tower.transform.localPosition = nextPosition;
        Body_tower.transform.localScale = new Vector3(1, 1, 1);
    }


    void Update()
    {
        if (number_Of_Floor == 2)
        {
            top_tower.GetComponent<TweenPosition>().from = fromPosition;
            top_tower.GetComponent<TweenPosition>().to = toPosition;
            top_tower.GetComponent<TweenPosition>().PlayForward();
            
            fromPosition += new Vector3(0, 66, 0);
            toPosition += new Vector3(0, 66, 0);
            nextPosition += new Vector3(0, 66, 0);

            addFloor();
            number_Of_Floor = 0;
        }
    }
}
