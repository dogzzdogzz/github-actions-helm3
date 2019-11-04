FROM alpine:3.10.2

ENV HELM_3_FILE="https://get.helm.sh/helm-v3.0.0-rc.2-linux-amd64.tar.gz"
ENV KUBECTL_FILE="https://amazon-eks.s3-us-west-2.amazonaws.com/1.14.6/2019-08-22/bin/linux/amd64/kubectl"
ENV AWS_IAM_AUTHENTICATOR="https://amazon-eks.s3-us-west-2.amazonaws.com/1.14.6/2019-08-22/bin/linux/amd64/aws-iam-authenticator"
RUN apk add --no-cache ca-certificates jq curl bash nodejs python3 && \
    # Install helm version 3:
    curl -L ${HELM_3_FILE} |tar xvz && \
    mv linux-amd64/helm /usr/bin/helm && \
    chmod +x /usr/bin/helm && \
    rm -rf linux-amd64 && \
    pip3 install awscli
RUN curl -o kubectl ${KUBECTL_FILE} && \
    mv kubectl /usr/bin/kubectl && \
    mkdir -p /root/.kube
RUN curl -o aws-iam-authenticator ${KUBECTL_FILE} && \
    mv aws-iam-authenticator /usr/bin/aws-iam-authenticator 
WORKDIR /root
COPY . /root/
ENTRYPOINT ["/root/entrypoint.sh"]