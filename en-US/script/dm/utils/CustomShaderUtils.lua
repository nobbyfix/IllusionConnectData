module("CustomShaderUtils", package.seeall)

CUSTOM_BLUR = "customShader_blur"
CUSTOM_FLUXAY = "customShader_fluxay"
CUSTOM_FLUXAY2 = "customShader_fluxay2"
CUSTOM_FLUXAY_SUPER = "customShader_fluxay_super"
CUSTOM_STAR = "customShader_star"
CUSTOM_CIRCLE = "customShader_circle"
CUSTOM_CIRCLEOUTLINE = "customShader_circleOutline"
CUSTOM_WATER = "customShader_water"
CUSTOM_MASK = "customShader_mask"
CUSTOM_OUTLINE = "customShader_outlineLight"
CUSTOM_CIRCLE_SMOOTH = "customShader_circle_smooth"
local customShaderProgramAche = {}
local shader_f = {}
local commonShaderV = [[

	attribute vec4 a_position;
	attribute vec2 a_texCoord;
	attribute vec4 a_color;

	#ifdef GL_ES
	varying lowp vec4 v_fragmentColor;
	varying mediump vec2 v_texCoord;
	#else
	varying vec4 v_fragmentColor;
	varying vec2 v_texCoord;
	#endif

	void main()
	{
	    gl_Position = CC_PMatrix * a_position;
	    v_fragmentColor = a_color;
	    v_texCoord = a_texCoord;
	}
]]
local etc1ExtraStr = [[
	vec4 getFragColor(vec2 texCoord)
	{
		vec4 texColor = vec4(texture2D(CC_Texture0, texCoord).rgb, texture2D(CC_Texture1, texCoord).r);
        texColor.rgb *= texColor.a;
		return texColor;
	}
]]
local A8ExtraStr = [[
	vec4 getFragColor(vec2 texCoord)
	{
		vec4 texColor = vec4(texture2D(CC_Texture0, texCoord).rgb, texture2D(CC_Texture1, texCoord).a);
        texColor.rgb *= texColor.a;
		return texColor;
	}
]]
local normalExtraStr = [[
	vec4 getFragColor(vec2 texCoord)
	{
		return texture2D(CC_Texture0, texCoord);
	}
]]

local function getOrCreateProgram(type, alphaTextureFormat)
	local baseType = type

	if alphaTextureFormat then
		type = type .. "_" .. alphaTextureFormat
	end

	if customShaderProgramAche[type] then
		return customShaderProgramAche[type]
	end

	assert(shader_f[baseType], "没有此种shader类型：" .. baseType)

	local shader_f_str = shader_f[baseType]

	if alphaTextureFormat then
		if alphaTextureFormat == "A8" then
			shader_f_str = A8ExtraStr .. shader_f_str
		else
			shader_f_str = etc1ExtraStr .. shader_f_str
		end
	else
		shader_f_str = normalExtraStr .. shader_f_str
	end

	local program = cc.GLProgram:createWithByteArrays(commonShaderV, shader_f_str)

	program:retain()

	customShaderProgramAche[type] = program

	return program
end

function setCustomShaderToNodeByType(node, type)
	local sprite = node

	if not node.getTexture then
		sprite = node:getVirtualRenderer():getSprite()
	end

	local alphaTextureFormat = nil

	if sprite:getTexture():getAlphaTexture() then
		alphaTextureFormat = sprite:getTexture():getAlphaTexture():getStringForFormat()
	end

	local program = getOrCreateProgram(type, alphaTextureFormat)
	local glProgramState = cc.GLProgramState:getOrCreateWithGLProgram(program)

	node:setGLProgramState(glProgramState)

	return glProgramState
end

function setBlurToNode(node, blurRadius, sampleNum)
	blurRadius = blurRadius or 4
	sampleNum = sampleNum or 4

	if blurRadius < sampleNum then
		sampleNum = blurRadius
	end

	local glProgramState = setCustomShaderToNodeByType(node, CUSTOM_BLUR)
	local size = nil

	if not node.getTexture then
		size = node:getVirtualRenderer():getSprite():getTexture():getContentSizeInPixels()
	else
		size = node:getTexture():getContentSizeInPixels()
	end

	glProgramState:setUniformVec2("resolution", {
		x = size.width,
		y = size.height
	})
	glProgramState:setUniformFloat("blurRadius", blurRadius)
	glProgramState:setUniformFloat("sampleNum", sampleNum)
end

function setGrayPart(node, left, right, top, bottom)
	left = left or 0
	right = right or 1
	top = top or 0.5
	bottom = bottom or 0
	local glProgramState = setCustomShaderToNodeByType(node, CUSTOM_GrayPart)
	local size = nil

	if not node.getTexture then
		size = node:getVirtualRenderer():getSprite():getTexture():getContentSizeInPixels()
	else
		size = node:getTexture():getContentSizeInPixels()
	end

	glProgramState:setUniformVec2("resolution", {
		x = size.width,
		y = size.height
	})
	glProgramState:setUniformFloat("left", left)
	glProgramState:setUniformFloat("right", right)
	glProgramState:setUniformFloat("top", top)
	glProgramState:setUniformFloat("bottom", bottom)

	local startTime = os.clock()
	local sequence = cc.Sequence:create(cc.CallFunc:create(function ()
		time = os.clock() - startTime

		glProgramState:setUniformFloat("time", time)
	end))
	local action = cc.RepeatForever:create(sequence)

	node:runAction(action)
end

function setFluxayToNode(node, color)
	color = color or {}
	local glProgramState = setCustomShaderToNodeByType(node, CUSTOM_FLUXAY)
	local delay = cc.DelayTime:create(0)
	local startTime = os.clock()
	local time = 0

	glProgramState:setUniformFloat("time", time)

	local size = node:getTexture():getContentSizeInPixels()

	glProgramState:setUniformVec2("resolution", {
		x = size.width,
		y = size.height
	})

	local sequence = cc.Sequence:create(delay, cc.CallFunc:create(function ()
		time = os.clock() - startTime

		glProgramState:setUniformFloat("time", time)
	end))

	glProgramState:setUniformVec3("fluxayColor", {
		x = color.r or 255,
		y = color.g or 255,
		z = color.b or 255
	})

	local action = cc.RepeatForever:create(sequence)

	node:runAction(action)
end

function setFluxaySuperToNode(node, color)
	color = color or {}
	local glProgramState = setCustomShaderToNodeByType(node, CUSTOM_FLUXAY_SUPER)
	local delay = cc.DelayTime:create(0)
	local startTime = os.clock()
	local time = 0

	glProgramState:setUniformFloat("time", time)

	local size = node:getTexture():getContentSizeInPixels()

	glProgramState:setUniformVec2("resolution", {
		x = size.width,
		y = size.height
	})

	local sequence = cc.Sequence:create(delay, cc.CallFunc:create(function ()
		time = os.clock() - startTime

		glProgramState:setUniformFloat("time", time)
	end))

	glProgramState:setUniformVec3("fluxayColor", {
		x = (color.r or 255) / 255,
		y = (color.g or 255) / 255,
		z = (color.b or 255) / 255
	})

	local action = cc.RepeatForever:create(sequence)

	node:runAction(action)
end

function setStarToNode(node)
	local glProgramState = setCustomShaderToNodeByType(node, CUSTOM_STAR)
	local delay = cc.DelayTime:create(0)
	local startTime = os.clock()
	local time = 0

	glProgramState:setUniformFloat("time", time)

	local sequence = cc.Sequence:create(delay, cc.CallFunc:create(function ()
		time = os.clock() - startTime

		glProgramState:setUniformFloat("time", time)
	end))
	local action = cc.RepeatForever:create(sequence)

	node:runAction(action)
end

function setCircleSmoothToNode(node, edge)
	local glProgramState = setCustomShaderToNodeByType(node, CUSTOM_CIRCLE_SMOOTH)
end

function setCircleToNode(node, edge)
	local glProgramState = setCustomShaderToNodeByType(node, CUSTOM_CIRCLE)

	glProgramState:setUniformFloat("u_edge", edge or 0.05)
end

function setCircleOutlineToNode(node)
	local glProgramState = setCustomShaderToNodeByType(node, CUSTOM_CIRCLEOUTLINE)
	local size = node:getContentSize()

	glProgramState:setUniformVec2("resolution", {
		x = size.width,
		y = size.height
	})
end

function setWaterToNode(node)
	local glProgramState = setCustomShaderToNodeByType(node, CUSTOM_WATER)
	local delay = cc.DelayTime:create(0)
	local startTime = os.clock()
	local time = 0

	glProgramState:setUniformFloat("time", time)

	local size = node:getTexture():getContentSizeInPixels()

	glProgramState:setUniformVec2("resolution", {
		x = size.width,
		y = size.height
	})

	local sequence = cc.Sequence:create(delay, cc.CallFunc:create(function ()
		time = os.clock() - startTime

		glProgramState:setUniformFloat("time", time)
	end))
	local action = cc.RepeatForever:create(sequence)

	node:runAction(action)
end

function setDynamicOutlineLightToNode(node)
	local glProgramState = setCustomShaderToNodeByType(node, CUSTOM_OUTLINE)
	local delay = cc.DelayTime:create(0)
	local startTime = os.clock()
	local time = 0

	glProgramState:setUniformFloat("time", time)

	local size = node:getTexture():getContentSizeInPixels()
	local sequence = cc.Sequence:create(delay, cc.CallFunc:create(function ()
		time = os.clock() - startTime

		glProgramState:setUniformFloat("time", time)
	end))
	local action = cc.RepeatForever:create(sequence)

	node:runAction(action)
end

shader_f.customShader_grayPart = [[
	#ifdef GL_ES
	precision mediump float;
	#endif

	varying vec4 v_fragmentColor;
	varying vec2 v_texCoord;

	uniform vec2 resolution;
	uniform float left;
	uniform float right;
	uniform float top;
	uniform float bottom;
	uniform float time;
	void main(void)
	{	
		vec2 uv = v_texCoord.xy;
		float aaa = (sin(time * 30.) + 1.) / 2.;
		if (uv.x >= aaa && uv.x <= right)
		{
			if (uv.y >= bottom && uv.y <= top){
				vec4 c = getFragColor(v_texCoord);
				float clrbright = (c.r + c.g + c.b) * (1. / 3.);
				float gray = (0.6) * clrbright;
				gl_FragColor = vec4(gray,gray+ 0.1,gray + 0.2,1.);
			}else{
				gl_FragColor = getFragColor(v_texCoord);
			}
		}else{
			gl_FragColor = getFragColor(v_texCoord);
		}
	}
]]
shader_f.customShader_circle_smooth = [[
	#ifdef GL_ES
	precision mediump float;
	#endif

	varying vec4 v_fragmentColor;
	varying vec2 v_texCoord;

	void main(void)
	{	
		vec2 uv = v_texCoord.xy;
		uv-=0.5;
		float detal = smoothstep(0.48,0.5,distance(uv.xy, vec2(0.)));	
		vec4 finalColor = getFragColor(v_texCoord);	
		finalColor.a *= (1.-detal);
		if (1.-detal == 0.)
		{
			gl_FragColor = vec4(0.);
		}else{
			gl_FragColor = finalColor;
		}
	}
]]
shader_f.customShader_blur = [[
	#ifdef GL_ES
	precision mediump float;
	#endif

	varying vec4 v_fragmentColor;
	varying vec2 v_texCoord;

	uniform vec2 resolution;
	uniform float blurRadius;
	uniform float sampleNum;

	vec4 blur(vec2);

	void main(void)
	{
		vec4 col = blur(v_texCoord);
		gl_FragColor = vec4(col) * v_fragmentColor;
	}

	vec4 blur(vec2 p)
	{
		if (blurRadius > 0.0 && sampleNum > 1.0)
		{
			vec4 col = vec4(0);
			vec2 unit = 1.0 / resolution.xy;

			float r = blurRadius;
			float sampleStep = r / sampleNum;

			float count = 0.0;

			for(float x = -r; x < r; x += sampleStep)
			{
				for(float y = -r; y < r; y += sampleStep)
				{
					float weight = (r - abs(x)) * (r - abs(y));
					col += getFragColor(p + vec2(x * unit.x, y * unit.y)) * weight;
					count += weight;
				}
			}
			return col / count;
		}

		return getFragColor(p);
	}
]]
shader_f.customShader_fluxay = [[
#ifdef GL_ES
precision mediump float;
#endif
varying vec4 v_fragmentColor;
varying vec2 v_texCoord;
uniform float time;
uniform vec3 fluxayColor;
void main()
{
vec4 src_color = getFragColor(v_texCoord).rgba;

float width = 0.04;       //流光的宽度范围 (调整该值改变流光的宽度)
float start = tan(time*2.0/1.414);  //流光的起始x坐标
float strength = 0.006;   //流光增亮强度   (调整该值改变流光的增亮强度)
float offset = 0.5;      //偏移值         (调整该值改变流光的倾斜程度)
if( v_texCoord.x < (start - offset * v_texCoord.y) &&  v_texCoord.x > (start - offset * v_texCoord.y - width))
{
vec3 improve = strength * fluxayColor;
vec3 result = improve * vec3( src_color.r, src_color.g, src_color.b);
gl_FragColor = vec4(result, src_color.a)*v_fragmentColor;

}else{
gl_FragColor = src_color*v_fragmentColor;
}
}
]]
shader_f.customShader_fluxay2 = [[
#ifdef GL_ES
precision mediump float;
#endif

varying vec4 v_fragmentColor;
varying vec2 v_texCoord;

// uniform float factor;
// uniform float width;
uniform float time;
// uniform vec3 color;
void main()
{
float factor = .06;
float width = .02;
// float offset = .5;
vec3 color = vec3(10.,10.,10.);
vec4 texColor = getFragColor(v_texCoord);

float distance = abs(v_texCoord[0]+v_texCoord[1]-tan(time))/1.414;

distance = 1.0-(1.0/width)*distance;
distance = max(distance, 0.0);
vec4 sample = vec4(0.0,0.0,0.0,0.0);
sample[0] = color[0] * distance;
sample[1] = color[1] * distance;
sample[2] = color[2] * distance;
sample[3] = distance;

float alpha = sample[3]*texColor[3];
texColor[0] = texColor[0] + sample[0]*alpha*factor;
texColor[1] = texColor[1] + sample[1]*alpha*factor;
texColor[2] = texColor[2] + sample[2]*alpha*factor;
gl_FragColor = v_fragmentColor * texColor;
}
]]
shader_f.customShader_star = [[
#ifdef GL_ES
precision mediump float;
#endif

#define M_PI 3.1415926535897932384626433832795
varying vec4 v_fragmentColor;
varying vec2 v_texCoord;
uniform float time;
uniform vec2 resolution;
float rand(vec2 co)
{
	return fract(sin(dot(co.xy ,vec2(12.9898,78.233))) * 43758.5453);
}

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
	float size = 10.0;
	float prob = 0.95;

	vec2 pos = floor(1.0 / size * fragCoord.xy);

	float color = 0.0;
	float g = .0;
	float b = .0;
	float starValue = rand(pos);

	if (starValue > prob)
	{
		vec2 center = size * pos + vec2(size, size) * 0.5;

		float t = 0.9 + .9*sin(.3*time) * sin(time + (starValue - prob) / (1.0 - prob) * 45.0);

		color = 1.0 - distance(fragCoord.xy, center) / (0.5 * size);
		color = color * t/ (abs(fragCoord.y - center.y)) * t / (abs(fragCoord.x - center.x));
		b = color *sin(t)*t;
		g = color*t;
	}
	else if (rand(fragCoord.xy / resolution.xy) > 0.996)
	{
		float r = rand(fragCoord.xy);
		color = r * (0.35 * sin(time * (r * 5.0) + 720.0 * r) + 0.75);
		g = r * (0.35 * sin(time * (r * 5.0) + 720.0 * r) + 0.75);
		b = r * (0.35 * sin(time * (r * 5.0) + 720.0 * r) + 0.75);
	}
	vec4 textureColor = getFragColor(v_texCoord);
	fragColor = textureColor * v_fragmentColor;
	if (fragColor.a + fragColor.g + fragColor.r + fragColor.b > 0.1)
	{
		fragColor = vec4(fragColor.rgb + vec3(color,g,b),fragColor.a);
	}
}
void main()
{
	mainImage(gl_FragColor, gl_FragCoord.xy);
}
]]
shader_f.customShader_circle = [[
	#ifdef GL_ES
	precision mediump float;
	#endif

	varying vec4 v_fragmentColor;
	varying vec2 v_texCoord;

	uniform float u_edge;
	void main()
	{
		float edge = u_edge;
		float dis = 0.0;
		vec2 texCoord = v_texCoord;
		if ( texCoord.x < edge )
		{
			if ( texCoord.y < edge )
			{
				dis = distance( texCoord, vec2(edge, edge) );
			}
			if ( texCoord.y > (1.0 - edge) )
			{
				dis = distance( texCoord, vec2(edge, (1.0 - edge)) );
			}
			}
			else if ( texCoord.x > (1.0 - edge) )
			{
				if ( texCoord.y < edge )
			{
				dis = distance( texCoord, vec2((1.0 - edge), edge ) );
			}
			if ( texCoord.y > (1.0 - edge) )
			{
				dis = distance( texCoord, vec2((1.0 - edge), (1.0 - edge) ) );
			}
		}

		if(dis > 0.001)
		{
			// 外圈沟
			float gap = edge * 0.02;
			if(dis <= edge - gap)
			{
				gl_FragColor = getFragColor(texCoord);
			}
			else if(dis <= edge)
			{
				// 平滑过渡
				float t = smoothstep(0.,gap,edge-dis);
				vec4 color = getFragColor(texCoord);
				if ( color.a < 0.05 ){
					t = color.a;
				}
				gl_FragColor = vec4(color.rgb,t);
			}else{
				gl_FragColor = vec4(0.,0.,0.,0.);
			}
		}
		else
		{
			gl_FragColor = getFragColor(texCoord);
		}
	}
]]
shader_f.customShader_circleOutline = [[
#ifdef GL_ES
precision mediump float;
#endif

uniform float time;
uniform vec2 resolution;
varying vec2 v_texCoord;

float ringWidth = 0.49;
vec3 ringColor = vec3(1.0,0.3,0.3);

vec4 outline(float width, vec2 tc, vec3 color, sampler2D tex){
vec4 t = getFragColor(tc);
tc -= 0.5;
tc.x *= resolution.x / resolution.y;

float grad = length(tc);
float circle = smoothstep(0.5, 0.48, grad);
float ring = circle - smoothstep(width, width-0.03, grad);

t = (t * (circle - ring));
t.rgb += (ring * ringColor);

return t;
}

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
vec2 uv = v_texCoord.xy;

vec4 t = outline(ringWidth, uv, ringColor, CC_Texture0);

fragColor = t;
}

void main()
{
mainImage(gl_FragColor, gl_FragCoord.xy);
}
]]
shader_f.customShader_fluxay_super = [[
#define TAU 6.120470874064187
#define MAX_ITER 5
uniform float time;
varying vec2 v_texCoord;
varying vec4 v_fragmentColor;
uniform vec3 fluxayColor;
void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
float time = time * .5+5.;
// uv should be the 0-1 uv of texture...
vec2 uv = v_texCoord.xy;


vec2 p = mod(uv*TAU, TAU)-250.0;

vec2 i = vec2(p);
float c = 1.0;
float inten = .0045;

for (int n = 0; n < MAX_ITER; n++)
{
float t =  time * (1.0 - (3.5 / float(n+1)));
i = p + vec2(cos(t - i.x) + sin(t + i.y), sin(t - i.y) + cos(1.5*t + i.x));
c += 1.0/length(vec2(p.x / (cos(i.x+t)/inten),p.y / (cos(i.y+t)/inten)));
}
c /= float(MAX_ITER);
c = 1.17-pow(c, 1.4);
vec4 tex = getFragColor(uv);
vec3 colour = vec3(pow(abs(c), 20.0));
colour = clamp(colour + vec3(0.0, 0.0, .0), 0.0, tex.a)*fluxayColor;

// 混合波光
float alpha = c*tex[3];
tex[0] = tex[0] + colour[0]*alpha;
tex[1] = tex[1] + colour[1]*alpha;
tex[2] = tex[2] + colour[2]*alpha;
fragColor = v_fragmentColor * tex;
}
void main()
{
mainImage(gl_FragColor, gl_FragCoord.xy);
}
]]
shader_f.customShader_water = [[
 #ifdef GL_ES
    precision mediump float;
    #endif

    #define F cos(x-y)*cos(y),sin(x+y)*sin(y)

    uniform float time;
    uniform vec2 resolution;
    varying vec2 v_texCoord;

    vec2 s(vec2 p)
    {
        float d=time*0.2,x=8.*(p.x+d),y=8.*(p.y+d);
        return vec2(F);
    }
    void mainImage( out vec4 fragColor, in vec2 fragCoord )
    {
        // 换成resolution
        vec2 rs = resolution.xy;
        // 换成纹理坐标v_texCoord.xy
        vec2 uv = v_texCoord.xy;
        vec2 q = uv+2./resolution.x*(s(uv)-s(uv+rs));
        //反转y
        // q.y=1.-q.y;
        fragColor = getFragColor(q);
    }
    void main()
    {
        mainImage(gl_FragColor, gl_FragCoord.xy);
    }
]]
shader_f.customShader_mask = [[
#ifdef GL_ES
precision mediump float;
#endif

varying vec4 v_fragmentColor;
varying vec2 v_texCoord;

// uniform float factor;
// uniform float width;
uniform float time;
// uniform vec3 color;
void main()
{
float w = 0.5;
vec4 texColor = getFragColor(v_texCoord);
gl_FragColor = v_fragmentColor * texColor;
if(abs(0.5 - v_texCoord.x) > w/2.0 && texColor.a > 0.1){
    gl_FragColor.a = 1.0 - (abs(0.5 - v_texCoord.x) - w/2.0)/((1.0-w)/4.0);
}

gl_FragColor = vec4(gl_FragColor.rgb * gl_FragColor.a,gl_FragColor.a);
}
]]
shader_f.customShader_outlineLight = [[
                                           
#ifdef GL_ES                                
precision mediump float;                    
#endif                                      

varying vec4 v_fragmentColor;               
varying vec2 v_texCoord;                                 
uniform float time;
void main()                                 
{                                           
float radius = 0.03*sin(16.0*time + 1.7);
vec4 accum = vec4(0.0);
vec4 normal = vec4(0.0);
normal = getFragColor(vec2(v_texCoord.x, v_texCoord.y));
accum += getFragColor(vec2(v_texCoord.x - radius, v_texCoord.y - radius));
accum += getFragColor(vec2(v_texCoord.x + radius, v_texCoord.y - radius));
accum += getFragColor(vec2(v_texCoord.x + radius, v_texCoord.y + radius));
accum += getFragColor(vec2(v_texCoord.x - radius, v_texCoord.y + radius));
accum += normal;
accum += getFragColor(vec2(v_texCoord.x - radius, v_texCoord.y));
accum += getFragColor(vec2(v_texCoord.x + radius, v_texCoord.y));
accum += getFragColor(vec2(v_texCoord.x, v_texCoord.y - radius));
accum += getFragColor(vec2(v_texCoord.x, v_texCoord.y + radius));
accum.a *= 1.0/4.0;
accum =  v_fragmentColor * accum.a;
normal = ( accum * (1.0 - normal.a)) + (normal * normal.a);
gl_FragColor = v_fragmentColor.a * normal;
}
]]
