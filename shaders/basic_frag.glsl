uniform sampler2D gtexture;
uniform sampler2D lightmap;

/* DRAWBUFFERS:0 */
layout(location = 0) out vec4 outColor0;

in vec2 texCoord;
in vec3 foliageColor;
flat in ivec2 lightMapCoords;

void main() {
    vec3 lightColor = texture2D(lightmap, vec2(lightMapCoords)).rgb;

    vec4 outputColorData = texture2D(gtexture, texCoord);
    vec3 outputColor = outputColorData.rgb * foliageColor * lightColor;
    float transparency = outputColorData.a;
    if (transparency < .1) {
        discard;
    }
    outColor0 = vec4(outputColor,transparency);
}