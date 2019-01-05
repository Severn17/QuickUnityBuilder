#!/bin/sh

#����Jenkins���ӻ�����Ĳ���
BUILD_TARGET=$Build_Target
UNITY_CHANNEL=$Unity_Channel;

if [[ $BUILD_TARGET = "Android" ]]; then
  REMOTE_BUILD_TARGET_NAME="ANDROID"
elif  [[ $BUILD_TARGET = "iOS" ]]; then
  REMOTE_BUILD_TARGET_NAME="IOS"
else 
  echo "Log Error : ����Ĵ��ƽ̨���� : ${BUILD_TARGET}"
    exit 1
fi

PROJ_GIT_PATH="/Users/mac2144/Documents/ylclient_ios_resbranch/ylclient"
BUILD_TOOL_PATH="${PROJ_GIT_PATH}/AutoBuilder/PackTools"

echo "--> ��ʼˢ��CDN" 
echo "--> ˢ��Ŀ¼: http://res.ylqt.2144gy.com/${UNITY_CHANNEL}/${REMOTE_BUILD_TARGET_NAME}/" 

python $BUILD_TOOL_PATH/Qcloud_CDN_API/QcloudCdnTools_V2.py RefreshCdnDir -u AKIDCCzXq6L0f5GG1XNrlcP3ShgPs52koNIx -p ZtxlIfnfHdjY7QTFl4A2e2B4g27wf8LI --dirs http://res.ylqt.2144gy.com/${UNITY_CHANNEL}/${REMOTE_BUILD_TARGET_NAME}/

if [ $? = 0 ];then
  echo "--> CDNˢ�³ɹ� "
else
  echo "--> CDNˢ��ʧ�� "
   exit 1
fi



#!/bin/sh

PROJ_GIT_PATH="/Users/mac2144/Documents/ylclient_android/ylclient/AutoBuilder/Qcloud_CDN_API"
#python $PROJ_GIT_PATH/QcloudCdnTools_V2.py RefreshCdnDir -u AKIDCCzXq6L0f5GG1XNrlcP3ShgPs52koNIx -p ZtxlIfnfHdjY7QTFl4A2e2B4g27wf8LI --dirs http://res.ylqt.2144gy.com/test_in_1/

python $PROJ_GIT_PATH/QcloudCdnTools_V2.py GetCdnRefreshLog -u AKIDCCzXq6L0f5GG1XNrlcP3ShgPs52koNIx -p ZtxlIfnfHdjY7QTFl4A2e2B4g27wf8LI --startDate 2018-11-30 --endDate 2018-11-30