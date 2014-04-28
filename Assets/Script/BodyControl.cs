using UnityEngine;
using System.Collections;

public class BodyControl : MonoBehaviour {
	public GameObject body_tower;
	public GameObject top_tower;
	public GameObject button;
	// Use this for initialization
	void Start () {
		Instantiate (body_tower, new Vector3 (7.69f, -30f, 0), body_tower.transform.rotation);
		Instantiate (body_tower, new Vector3 (7.69f, -19f, 0), body_tower.transform.rotation);
		Instantiate (body_tower, new Vector3 (7.69f, -8f, 0), body_tower.transform.rotation);
	}
	
	// Update is called once per frame
	void Update () {

	}
}
