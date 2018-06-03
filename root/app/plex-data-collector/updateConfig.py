import os
import configparser

config = configparser.SafeConfigParser()
config.read(os.path.dirname(os.path.realpath(__file__)) + "/config.ini")

iAddress = os.getenv("INFLUXDB_ADDRESS")
iPort = os.getenv("INFLUXDB_PORT")
iDb = os.getenv("INFLUXDB_DATABASE")
iUser = os.getenv("INFLUXDB_USERNAME", "")
iPass = os.getenv("INFLUXDB_PASSWORD", "")

pUser = os.getenv("PLEX_USERNAME", "")
pPass = os.getenv("PLEX_PASSWORD", "")
pServers = os.getenv("PLEX_SERVERS")

config.set('INFLUXDB', 'address', iAddress)
config.set('INFLUXDB', 'port', iPort)
config.set('INFLUXDB', 'database', iDb)
config.set('INFLUXDB', 'username', iUser)
config.set('INFLUXDB', 'password', iPass)

config.set('PLEX', 'username', pUser)
config.set('PLEX', 'password', pPass)
config.set('PLEX', 'servers', pServers)

with open('config.ini', 'w') as configfile:
    configfile.write("#For usage see: https://github.com/barrycarey/Plex-Data-Collector-For-InfluxDB/blob/master/config.ini")
    configfile.write("\n")
    config.write(configfile)