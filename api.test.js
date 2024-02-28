//unit test
const axios=require("axios")
const predictUrl="http://localhost:3000/api/moderation/predict"
const scoreUrl="http://localhost:3000/api/moderation/score"
//random data
const data={
    text:"bonjour",
    language:"fr-FR"
    
}
describe("Post requests of api", () => {
    //first test from prediction route
    describe('post request to get prediction', () => {
        test('should respond with 200 status code and prediction exist', async() => {
            const response=await axios.post(predictUrl,data
            )
            //status must be 200 and contain a prediction value
            expect(response.status).toBe(200);
            expect(response.data.prediction).toBeDefined();
          
        })
        
    });
    //second test for score route
    describe('post request to get score', () => {
        test('should respond with 200 status code and score exist', async() => {
            const response=await axios.post(scoreUrl,data
            )
            expect(response.status).toBe(200);
            expect(response.data.score).toBeDefined();
          
        })
        
    });
        
});
