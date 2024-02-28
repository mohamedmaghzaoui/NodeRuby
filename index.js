//import express and axois
const express=require("express")
const axios=require("axios")
const app=express()
const port=3000
const bodyParser = require('body-parser');



app.use(express.json())
app.use(bodyParser.json());
//post request
app.post('/api/moderation/predict', async(req, res) => {
    //get daata and send it in url as paramter
    const { text, language } = req.body;
    try{
        //get data from moderation predict api
        const response=await axios.get("https://moderation.logora.fr/predict",{
            params:{
                text,
                language
            }
        
        })
        //result
        res.json(response.data)
    }catch(error){
        res.send(error)

    }
  });
  //get request
app.post('/api/moderation/score', async(req, res) => {
    //get data
    const { text, language }=req.body
    try{
        //get data from moderation score api
        const response=await axios.get("https://moderation.logora.fr/score",{
            params:{
                text,
                language
            }
        
        })
        //result
        res.json(response.data)
    }catch(error){
        res.send(error)

    }
  });
app.listen(port,()=>{console.log("server running on 3000")})


