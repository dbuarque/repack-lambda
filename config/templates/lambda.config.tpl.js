module.exports = {
    region: 'us-east-1',
    handler: 'index.handler',
    role: process.env.ROLE_ARN,
    functionName: process.env.APP,
    timeout: 60,
    memorySize: 128,
    runtime: 'nodejs'
}