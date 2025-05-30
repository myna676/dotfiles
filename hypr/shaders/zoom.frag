// zoom_fade_transition.frag
in vec2 v_texCoord;
out vec4 fragColor;
uniform sampler2D u_texture;
uniform float u_progress; // 0 to 1

void main() {
    vec2 center = vec2(0.5, 0.5);
    vec2 uv = (v_texCoord - center) / (1.0 + 0.5 * (1.0 - u_progress)) + center;
    vec4 color = texture(u_texture, uv);
    fragColor = vec4(color.rgb, color.a * u_progress);
}
