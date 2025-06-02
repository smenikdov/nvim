fastify.route({
    method: 'POST',
    url:    '/example',
    schema: {
        body: {
            type: 'object',
            properties: {
                file: { type: 'array', items: 'MultipartFileType#' },
                projectId: { type: 'integer' },
            },
            required: [
                'file',
                'projectId',
            ],
        },
        response: {
            400: {
                type: 'object',
                properties: {
                    message: { type: 'string' },
                    statusCode: { type: 'integer' },
                },
            },
        },
    },

    async handler(request, reply) {
        if (request.info.userRole !== userRoles.admin) {
            reply.code(403);
            reply.send({ 'message': 'Access denied role', 'statusCode': 403 });
            return;
        }

        const data = await job.example(request.body, request.info, request.profile);
        if (data.statusCode !== 200) {
            reply.status(400);
        }
        reply.send(data);
    },
});

