using UnityEngine;
using System.Collections;

public class BodyControl : MonoBehaviour {
	public GameObject body_tower;
	public GameObject Body_tower;
	public GameObject parent;
	public GameObject top_tower;
	// Use this for initialization
	void Start () {
		Body_tower = Instantiate (body_tower) as GameObject;
		Body_tower.transform.parent = parent.transform;
		Body_tower.transform.localPosition = new Vector3 (-199, -329, 0); 
		Body_tower.transform.localScale = new Vector3(1,1,1);
	}

	// Update is called once per frame
	void Update () {
	}
}
