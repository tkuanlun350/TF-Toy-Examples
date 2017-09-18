import pynvml as N
import urllib2

"""
crontab command
*/5 * * * *  /path/to/your/script/gpu-script.sh 
"""
def sendToSlack(index):
    # Configure to your own channel using slack web-hook
    url = "https://hooks.slack.com/services/XXX/XXX/XXXX"
    data = '{"text":"GPU %d is available"}'%index
    req = urllib2.Request(url, data, {'Content-Type': 'application/json'})
    f = urllib2.urlopen(req)
    f.close()

N.nvmlInit()
flag = 0
for index in range(N.nvmlDeviceGetCount()):
    handle = N.nvmlDeviceGetHandleByIndex(index)
    memory = N.nvmlDeviceGetMemoryInfo(handle)
    fraction = (float(memory.used) / memory.total) * 100
    if (fraction < 50):
        sendToSlack(index)
        flag = 1
        break