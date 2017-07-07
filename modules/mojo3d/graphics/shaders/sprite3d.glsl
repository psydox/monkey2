//@renderpasses 0

//material uniforms

uniform mat3 m_TextureMatrix;

//renderer uniforms...

uniform mat4 r_ModelViewProjectionMatrix;

//varyings...

varying vec2 v_TexCoord0;

//@vertex

attribute vec4 a_Position;

attribute vec2 a_TexCoord0;

void main(){

	v_TexCoord0=(m_TextureMatrix * vec3(a_TexCoord0,1.0)).st;
	
	gl_Position=r_ModelViewProjectionMatrix * a_Position;
}

//@fragment

uniform sampler2D m_ColorTexture;

uniform vec4 m_ColorFactor;

void main(){

	vec3 color=pow( texture2D( m_ColorTexture,v_TexCoord0 ).rgb,vec3( 2.2 ) ) * m_ColorFactor.rgb;
	
	float alpha=texture2D( m_ColorTexture,v_TexCoord0 ).a * m_ColorFactor.a;
	
	gl_FragColor=vec4( color,alpha );
}
