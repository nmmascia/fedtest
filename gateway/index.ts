import { ApolloGateway, IntrospectAndCompose } from "@apollo/gateway";

import { ApolloServer } from "apollo-server";

const gateway = new ApolloGateway({
  supergraphSdl: new IntrospectAndCompose({
    subgraphs: [
      { name: "accounts", url: `http://localhost:3000/graphql` },
      { name: "bookings", url: `http://localhost:4000/graphql` },
    ],
  }),
});

const server = new ApolloServer({
  gateway: gateway,
  introspection: true,
});

const main = async () => {
  try {
    const { url } = await server.listen({
      port: 3131,
    });
    console.log(`🚀 Gateway ready at ${url}`);
  } catch (error) {
    console.error(error);
  }
};

main();
