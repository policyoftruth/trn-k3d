k3d cluster create mycluster \
    -p "8082:30080@agent:0" \
    --agents 2 \
    --k3s-arg "--disable=traefik@server:0"
