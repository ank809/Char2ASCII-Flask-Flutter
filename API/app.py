from flask import Flask, request, jsonify

app= Flask(__name__)

@app.route('/get_ascii', methods=['GET'])
def returnascii():
    d={}
    inputchr= str(request.args.get('query'))
    output= str(ord(inputchr))
    print(output)
    d['output']=output
    return d
if __name__=="__main__":
    app.run(debug=True)