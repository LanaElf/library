#FROM node:23-bookworm-slim as base
#
#ARG PORT=3000
#
#WORKDIR /frontend
#
## Build
#FROM base as build
#
#COPY --link package.json ./
##RUN npm install \
##&& apt install -y wget \
##&& wget -qO- https://get.pnpm.io/install.sh | ENV="$HOME/.shrc" SHELL="$(which sh)" sh -
#
#RUN npm install -g pnpm \
#&& pnpm install --frozen-lockfile
#
#COPY --link . .
#
#RUN pnpm run build
#
## Run
#FROM base
#
#ENV PORT=$PORT
#ENV NODE_ENV=production
#
#ENV NUXT_PORT=3000
#ENV NITRO_PORT=3000
#ENV NITRO_HOST=0.0.0.0
#ENV NUXT_HOST=0.0.0.0
## ENV HOST=0.0.0.0
#
#EXPOSE 3000
#
#COPY --from=build /frontend/.output /frontend/.output
#
#CMD [ "node", "/library/.nuxt/dev/index.mjs" ]

FROM node:23-bookworm-slim

WORKDIR /frontend

COPY . .

RUN npm install -g pnpm
RUN pnpm install --frozen-lockfile

ENV NODE_ENV=production

ENV NUXT_PORT=3000
ENV NITRO_PORT=3000
ENV NITRO_HOST=0.0.0.0
ENV NUXT_HOST=0.0.0.0
# ENV HOST=0.0.0.0

EXPOSE 3000

RUN pnpm run build
CMD ["node", "/frontend/.output/server/index.mjs"]