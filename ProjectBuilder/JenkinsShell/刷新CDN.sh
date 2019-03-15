#!/bin/sh

#���ղ���
JP_BUILD_TARGET=$Build_Target
JP_UNITY_SERVER=$Unity_Server;

echo "--> �����ƽ̨����" 
SUPPORT_TARGETS=("Android" "iOS" "Pc")
if echo "${SUPPORT_TARGETS[@]}" | grep -w $JP_BUILD_TARGET &>/dev/null; then
  echo "--> ��ǰ���ƽ̨����: ${JP_BUILD_TARGET}" 
else
  echo "Error : ��֧�ֵĴ��ƽ̨���� : ${JP_BUILD_TARGET}"
  exit 1
fi

if [[ $JP_BUILD_TARGET = "Android" ]]; then
  REMOTE_TARGET_NAME="ANDROID"
elif [[ $JP_BUILD_TARGET = "iOS" ]]; then
  REMOTE_TARGET_NAME="IOS"  
elif [[ $JP_BUILD_TARGET = "Pc" ]]; then
  REMOTE_TARGET_NAME="PC" 
fi

PROJ_GIT_PATH="/Users/mac2144/Documents/YLProjects/yl_official_android/ylqtclient"
PROJ_BUILDER_ROOT_PATH="${PROJ_GIT_PATH}/ProjectBuilder"
PROJ_BUILDER_TOOL_PATH="${PROJ_BUILDER_ROOT_PATH}/PackTools"

echo "--> ��ʼˢ��CDN" 
python ${PROJ_BUILDER_TOOL_PATH}/Qcloud_CDN_API/QcloudCdnTools_V2.py RefreshCdnDir -u AKIDCCzXq6L0f5GG1XNrlcP3ShgPs52koNIx -p ZtxlIfnfHdjY7QTFl4A2e2B4g27wf8LI --dirs http://res.ylqt.2144gy.com/${JP_UNITY_SERVER}/${REMOTE_TARGET_NAME}/
if [ $? = 0 ];then
  echo "--> CDNˢ�³ɹ� "
else
  echo "--> Error : CDNˢ��ʧ�� "
fi